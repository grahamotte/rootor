Rootor is an `XMLRPC` client rtorrent ruby interface.
```bash
gem install rootor
```

```ruby
require 'rootor'

r = Rootor.new('https://<user>:<password>@<server>:<port>/<xmlrpc>')

# get all your torrents
r.torrents

# make them more digestible
r.torrents.serialize

# find best one
r.torrents.sort_by(&:ratio).last

# add a new torrent
r.load_from_file('<file.torrent>')
```

Reference material
---
https://ruby-doc.org/stdlib-2.3.1/libdoc/xmlrpc/rdoc/XMLRPC/Client.html

https://github.com/mdevaev/emonoda/wiki/rTorrent-XMLRPC-Reference

https://github.com/rakshasa/rtorrent/wiki/rTorrent-0.9-Comprehensive-Command-list-(WIP)

https://github.com/rakshasa/rtorrent/wiki

https://github.com/Novik/ruTorrent/blob/master/js/rtorrent.js

https://github.com/rafipiccolo/node-rtorrent/blob/master/index.js