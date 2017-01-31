QUERIES = {
  hash: {call: 'hash', kind: :str},
  name: {call: 'name', kind: :str},
  path: {call: 'get_base_path', kind: :str},
  creation_date: {call: 'creation_date', kind: :date},
  message: {call: 'message', kind: :str},
  connection_current: {call: 'connection_current', kind: :str},
  is_active: {call: 'is_active', kind: :bool},
  is_open: {call: 'is_open', kind: :bool},
  size: {call: 'size_bytes', kind: :file},
  uploaded: {call: 'get_up_total', kind: :file},
  downloaded: {call: 'bytes_done', kind: :file},
  ratio: {call: 'get_ratio', kind: :ratio},
  up_rate: {call: 'get_up_rate', kind: :rate},
  down_rate: {call: 'get_down_rate', kind: :rate},
  trackers: {call: 'get_tracker_focus', kind: :str}
}.freeze
