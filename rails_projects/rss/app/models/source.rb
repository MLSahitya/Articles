class Source
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  #file = "/home/newsincontext/Desktop/TopStories"
  def self.store_feeds(file,g)  
      File.open(file) do |f|
      while line = f.gets  
            l= line.tr("\n",'') 
          unless Source.where(url: l,name: g).exists?
          create!(  #unless exists? :guid => entry.id
            :name     => g,  
            :url      => l  
          ) 
          end
          # FeedEntry.update_from_feed(l,g) 
      end  
    end  
 end
end
