from requests_html import HTMLSession
import wget

session = HTMLSession()
url = "http://www.dota2.com/heroes/"
r = session.get(url)
images = r.html.find(".heroHoverLarge")
for i, image in enumerate(images):
    link = image.attrs['src']
    wget.download(link)
