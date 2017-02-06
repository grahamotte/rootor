QUERIES = {
  downloads: {
    hash:        {call: 'hash', kind: :str},
    name:        {call: 'name', kind: :str},
    path:        {call: 'base_path', kind: :str},
    file_name:   {call: 'base_filename', kind: :str},
    created_at:  {call: 'creation_date', kind: :date},
    finished_at: {call: 'timestamp.finished', kind: :date},
    message:     {call: 'message', kind: :str},
    status:      {call: 'connection_current', kind: :str},
    is_active:   {call: 'is_active', kind: :bool},
    is_open:     {call: 'is_open', kind: :bool},
    size:        {call: 'size_bytes', kind: :file},
    uploaded:    {call: 'up.total', kind: :file},
    downloaded:  {call: 'down.total', kind: :file},
    ratio:       {call: 'ratio', kind: :ratio},
    up_rate:     {call: 'up.rate', kind: :rate},
    down_rate:   {call: 'down.rate', kind: :rate},
    private:     {call: 'is_private', kind: :str},
  },
  trackers:  {
    tracker_url:           {call: 'url', type: :str},
    tracker_type:          {call: 'type', type: :str},
    tracker_group:         {call: 'group', type: :str},
    tracker_success_count: {call: 'success_counter', type: :str},
    tracker_failed_count:  {call: 'failed_counter', type: :str},
  }
}.freeze

FLAT_QUERIES = QUERIES[:downloads].merge(QUERIES[:trackers]).freeze