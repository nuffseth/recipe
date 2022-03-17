# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy

class RecipeItem(scrapy.Item):
    id = scrapy.Field()
    idnum = scrapy.Field()
    imageURL = scrapy.Field()
    name = scrapy.Field()
    author = scrapy.Field()
    cuisine = scrapy.Field()
    difficulty = scrapy.Field()
    servingsize = scrapy.Field()
    preptime = scrapy.Field()
    cookingtime = scrapy.Field()
    ingredients = scrapy.Field()
    directions = scrapy.Field()

class Ingredients(scrapy.Item):
    name = scrapy.Field()
    ingredients = scrapy.Field()