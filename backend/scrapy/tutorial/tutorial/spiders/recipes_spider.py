import scrapy


class QuotesSpider(scrapy.Spider):
    name = "recipes"

    def start_requests(self):
        urls = [
            'https://doobydobap.com/recipe/blistered-garlic-olive-long-beans',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.url.split("/")[-2]
        filename = f'quotes-{page}.html'
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log(f'Saved file {filename}')