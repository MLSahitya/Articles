class FeedEntry
  include Mongoid::Document
  field :name, type: String
  field :summary, type: String
  field :url, type: String
  field :published_at, type: Time
  field :guid, type: String
  def self.update_from_feed(feed_url)  
      feed = Feedzirra::Feed.fetch_and_parse(feed_url)  
      feed.entries.each do |entry|  
         unless FeedEntry.where(guid: entry.id).exists?
          create!(  #unless exists? :guid => entry.id
            :name         => entry.title,  
            :summary      => entry.summary,  
            :url          => entry.url,  
            :published_at => entry.published,  
            :guid         => entry.id  
          )  
        end  
      end  
    end  
end
