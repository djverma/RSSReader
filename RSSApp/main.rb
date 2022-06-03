require_relative 'APImanager.rb'
require_relative 'Data.rb'

class RSSReader
   def Execute
      rssUrl = "https://news.yahoo.com/rss"
      rssManager = Manager.new

      rssChannel = rssManager.loadChannelFromUrl(rssUrl)
      puts rssChannel.Title
      puts rssChannel.Description
      puts rssChannel.Link

      for index in 0..rssChannel.RssItems.length-1 do
        puts rssChannel.RssItems[index].Title
        puts rssChannel.RssItems[index].Description[0..30]
        puts rssChannel.RssItems[index].Link
        puts rssChannel.RssItems[index].Guid
      end
   end
end

reader1 = RSSReader.new
reader1.Execute