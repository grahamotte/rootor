Rootor is an `XMLRPC` frontend for ruby. Requires `Filesize` gem and `xmlrpc/client`.

To run:
```
require_realtive 'lib/rootor'

queries = {
  id:   { call: 'hash', kind: :str },
  name: { call: 'name', kind: :str }
} # optional

r = Rootor.new('https://<user>:<password>@<server>:<port>/<xmlrpc>', queries)
```