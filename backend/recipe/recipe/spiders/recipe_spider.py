from doctest import master
import scrapy
from recipe.items import RecipeItem, Ingredients, CookBook

class RecipeSpider(scrapy.Spider):
    name = "recipe"
    idnum = int(0)
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


        recipe['id'] = str(self.idnum)
        recipe['name'] = response.css("h2.recipe-card-title::text").get()
        recipe['author'] = response.css("span.recipe-card-author::text").get()
        if(response.css("span.recipe-card-cuisine mark::Text").get() == None):
            recipe['cuisine'] = None
        else:
            cuisine = response.css("span.recipe-card-cuisine mark::Text").get().split(", ")
        recipe['difficulty'] = response.css("span.recipe-card-difficulty mark::Text").get()
        recipe['servingsize'] = response.css("div.detail-item.detail-item-0 p.detail-item-value.only-print-visible::text").get()
        
        preptime = response.css("div.detail-item.detail-item-1 p.detail-item-value::text").getall()
        preptime_unit = response.css("div.detail-item.detail-item-1 span.detail-item-unit::text").getall()
        cookingtime = response.css("div.detail-item.detail-item-2 p.detail-item-value::text").getall()
        cookingtime_unit = response.css("div.detail-item.detail-item-2 span.detail-item-unit::text").getall()
        recipe['preptime'] = " ".join(list(map(str.__add__, preptime, preptime_unit)))
        recipe['cookingtime'] = " ".join(list(map(str.__add__, cookingtime, cookingtime_unit)))
        
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
        self.increment()

        yield recipe

    def increment(self):
        self.idnum = self.idnum + 1