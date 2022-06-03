
require 'nokogiri'
require 'open-uri'
require_relative 'Data.rb'

class Manager
  
  def loadChannelFromUrl(rssUrl)
     
      xmlDoc = Nokogiri::XML(open(rssUrl))
      readChannelNode = xmlDoc.root.at_xpath("channel")
      readChannel = Channel.new
      readChannel.Description =  readChannelNode.at_xpath("description").content
      readChannel.Link =  readChannelNode.at_xpath("link").content
      readChannel.Title =  xmlDoc.root.at_xpath("channel/title").content
      readChannel.RssItems = loadItemsFromUrl(rssUrl)

      return readChannel

  end

  def loadItemsFromUrl(rssUrl)

      xmlDoc = Nokogiri::XML(open(rssUrl))
      rssItemNodes = xmlDoc.root.xpath("channel/item")
      rssItems = []

      for index in 0..rssItemNodes.length - 1 do
        rssItem = RssItem.new
        rssItem.Title = rssItemNodes[index].at_xpath("title").content
        rssItem.Description = rssItemNodes[index].at_xpath("description").content
        rssItem.Link = rssItemNodes[index].at_xpath("link").content
        rssItem.Guid = rssItemNodes[index].at_xpath("guid").content
        rssItems.push(rssItem)

      end

      return rssItems

  end

end