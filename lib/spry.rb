require 'yaml'

pwd = `pwd`
`git clone #{ARGV[0]} ~/tmp/spry`
`cd ~/tmp/spry`
`git checkout #{ARGV[1]}`

serialized_revisions = `git rev-list --reverse HEAD~4..HEAD`
revisions = YAML.load(serialized_revisions).split ' '
times = {}

revisions.each do |revision|
  `git checkout #{revision}`
  pair = `rspec perf | grep '^RUNTIME:' | awk '{print $3 "," $2}'`
  id, time = YAML.load(pair).split ','
  datum = { revision: revision, runtime: time }
  times[id] ? times[id] << datum : times[id] = [datum]
end

`git checkout #{ARGV[1]}`
`cd #{pwd}`
`sudo rm -rf ~/tmp/spry`

puts YAML.dump(times)
