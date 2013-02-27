require 'rubygems'
require 'readability'
require 'open-uri'

class Articles
def self.storeArticles(url)
puts "inside"
source = open(url).read
article = Readability::Document.new(source).content
return article
#http://newsroom.ucla.edu/portal/ucla/ucla-headlines-february-1-2013-243176.aspx
#'http://newsroom.ucla.edu/portal/ucla/resplendent-dress-from-southeastern-243234.aspx?link_page_rss=243234'
end
end
