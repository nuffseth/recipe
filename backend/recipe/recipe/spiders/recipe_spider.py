from datetime import datetime
from doctest import master
from time import time
import scrapy
from recipe.items import RecipeItem, Ingredients

class RecipeSpider(scrapy.Spider):
    name = "recipe"
    start_urls = ['https://doobydobap.com/recipes']


    def parse(self, response):
        totalpageNum = int(response.css("div.text-center.pt-cv-pagination-wrapper ul::attr(data-totalpages)").get())
        for page_num in range(1,totalpageNum+1):
            page_url = f'https://doobydobap.com/recipes?_page={page_num}'
            yield scrapy.Request(page_url,callback = self.parsePage)

    def parsePage(self,response):
        recipeURLs = response.css("h4.pt-cv-title a::attr(href)").getall()
        for recipeURL in recipeURLs:
            yield scrapy.Request(recipeURL, callback = self.parseRecipe)
    
    def parseRecipe(self,response):
        recipe = RecipeItem()
        recipe['id'] = None
        recipe['imageURL'] = response.css("div.wp-block-kadence-column.inner-column-1 img::attr(src)").get()
        recipe['name'] = response.css("h2.recipe-card-title::text").get()
        recipe['date'] = response.xpath("//meta[@property='article:modified_time']/@content").get()
        recipe['rating'] = float(response.css("div.recipe-card-heading div::attr(data-rating)").get())
        recipe['totalvotes'] = int(response.css("div.recipe-card-heading div::attr(data-rating-total)").get())
        recipe['author'] = response.css("span.recipe-card-author::text").get().split(" ")[2]
        if(response.css("span.recipe-card-cuisine mark::Text").get() == None):
            recipe['cuisine'] = None
        else:
            cuisine = response.css("span.recipe-card-cuisine mark::Text").get().split(", ")
        recipe['difficulty'] = response.css("span.recipe-card-difficulty mark::Text").get()
        rawServingsize = response.css("div.detail-item.detail-item-0 p.detail-item-value.only-print-visible::text").get()
        if(rawServingsize is None):
            rawServingsize = response.css("div.detail-item.detail-item-0 p.detail-item-value::text").get()
        if rawServingsize is not None and '-' in rawServingsize:
            rawServingsize = rawServingsize.split("-")[1]
        
        recipe['servingsize'] = int(rawServingsize)
        
        preptime = response.css("div.detail-item.detail-item-1 p.detail-item-value::text").getall()
        preptime_unit = response.css("div.detail-item.detail-item-1 span.detail-item-unit::text").getall()
        cookingtime = response.css("div.detail-item.detail-item-2 p.detail-item-value::text").getall()
        cookingtime_unit = response.css("div.detail-item.detail-item-2 span.detail-item-unit::text").getall()
        cleanup_unit(preptime_unit)
        cleanup_unit(cookingtime_unit)
        recipe['preptime'] = format_time(" ".join(list(map(' '.join, zip(preptime, preptime_unit)))))
        recipe['cookingtime'] = format_time(" ".join(list(map(' '.join, zip(cookingtime, cookingtime_unit)))))
        
        ingredientList = []
        recipe['ingredients'] = []
        ingredientPart = Ingredients()
        ingredientPart['name'] = "main"

        for ingredient in response.css("li.ingredient-item"):
            name = ingredient.css("span.wpzoom-rcb-ingredient-name::text").get()
            amount = ingredient.css("span.wpzoom-rcb-ingredient-amount::text").get()
            unit = ingredient.css("span.wpzoom-rcb-ingredient-unit::text").get()
            if(name == None and amount == None and unit == None):
                if(ingredientList != None):
                    ingredientPart['ingredients'] = ingredientList
                    recipe['ingredients'].append(dict(ingredientPart))
                    ingredientList = []
                    ingredientPart = Ingredients()
                ingredientPart['name'] = ingredient.css("strong.ingredient-item-group-title::text").get()
            else:
                oneIngredient = " ".join(filter(None, [amount, unit, name]))
                ingredientList.append(oneIngredient)
        
        ingredientPart['ingredients'] = ingredientList
        recipe['ingredients'].append(dict(ingredientPart))
        recipe['directions'] = response.css("li.direction-step::text").getall()

        yield recipe

def format_time(string):
    hourTime = False
    format_string = ''
    if 'hour' in string:
        if 'hours' in string:
            format_string += '%H hours'
        else:
            format_string += '%H hour'
        hourTime = True
    if 'minute' in string:
        if(hourTime == True):
            format_string += " "
        if 'minutes' in string:
            format_string += '%M minutes'
        else:
            format_string += '%M minute'
    if 'second' in string:
        if 'seconds' in string:
            format_string += '%S seconds'
        else:
            format_string += '%S second'
    value = datetime.strptime(string, format_string)
    return value.strftime('%H:%M:%S')

def cleanup_unit(string):
    for i in range(len(string)):
        if 'hour' in string[i]:
            string[i] = "hour"
        elif 'minute' in string[i]:
            string[i] = "minute"

