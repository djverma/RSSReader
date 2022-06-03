## RSSReader
 RSS reader
1. **Data.rb** : Stores the format of the data(feeds) to be displayed from an online RSS feed. Two Data models:
   1.  Channel: Stores the information of the feed.
   2.  Item:  Stores data from the items inside the channel.
2. **APImanager.rb**:  API to parse the xml from the rss and instantiate appropriate objects for the Channel class and Item class.
3. **main.rb** :  Starts the application and Displays over the console.
