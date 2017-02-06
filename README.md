Rootor is an `xmlrpc` rtorrent ruby frontend.
```bash
gem install rootor
```


```ruby
require 'rootor'

r = Rootor.new('https://<user>:<password>@<server>:<port>/<xmlrpc>')

puts r.torrents.length

r.load_from_file('<file.torrent>')
```

Reference 
---
https://github.com/mdevaev/emonoda/wiki/rTorrent-XMLRPC-Reference

http://elektito.com/2016/02/10/rtorrent-xmlrpc/

https://github.com/rakshasa/rtorrent/wiki/rTorrent-0.9-Comprehensive-Command-list-(WIP)

https://github.com/rakshasa/rtorrent/wiki

https://github.com/Novik/ruTorrent/blob/master/js/rtorrent.js

https://github.com/rafipiccolo/node-rtorrent/blob/master/index.js