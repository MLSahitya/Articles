require 'rubygems'
require 'readability'
require 'open-uri'

class FeedEntry
  include Mongoid::Document
  field :name, type: String
  field :summary, type: String
  field :url, type: String
  field :published_at, type: Time
  field :guid, type: String
  field :type, type: String
  field :article, type: String
	def self.update_from_feed(feed_url,g)
	#feed_url="http://www.seattlepi.com/national/collectionRss/AP-Top-News-9938.php"
	#  url="\""+feed_url+"\""
	#  puts url
	begin
  	feed = Feedzirra::Feed.fetch_and_parse(feed_url)
       	feed.entries.each do |entry|
         
 	unless FeedEntry.where(guid: entry.id, name: entry.title).exists? 
	source = open(entry.id).read
	#puts "sahi"         
	art = Readability::Document.new(source).content
         #puts article
      	 create!(
        :name     => entry.title,
        :summary  => entry.summary,
        :url      => entry.url,
        :published_at => entry.published,
        :guid     => entry.id,
        :type   => g,
        :article => art
        )
 	end
 	  end
rescue
f=File.open("/home/newsincontext/Desktop/Log","a+")
f.write(g+":"+feed_url + "\n")
f.close  
end
	end
        

end
