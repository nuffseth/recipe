import scrapy


class QuotesSpider(scrapy.Spider):
    name = "html"

    def start_requests(self):
        urls = [
            'https://doobydobap.com/recipes',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        filename = f'recipe-homepage.html'
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log(f'Saved file {filename}')