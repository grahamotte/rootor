Rootor is an `xmlrpc` rotrrent ruby frontend.

```
require 'rootor'

r = Rootor.new('https://<user>:<password>@<server>:<port>/<xmlrpc>')

puts r.torrents.length

r.load_from_file(<file.torrent>)
```

links
---
https://github.com/mdevaev/emonoda/wiki/rTorrent-XMLRPC-Reference
http://elektito.com/2016/02/10/rtorrent-xmlrpc/