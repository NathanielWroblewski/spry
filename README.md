# Spry

Spry runs your [Rspec](https://relishapp.com/rspec) performance tests and graphs the output using [D3](http://d3js.org/).

## Installation

Add this line to your application's Gemfile:

    gem 'spry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spry

## Usage

Create a folder in the root of your Rails app called `perf`, and create your performance tests within it.
Each performance test should print to STDOUT the unique identifier of the test and the time it took to run in the following format:
```
RUNTIME: 0.11111 OrdersController#show
```

Example:

##### perf/order_list_perf_spec.rb
```rb
require 'spec_helper'
require 'benchmark'

describe OrdersController, '#show', type: :controller do
  it 'is fast' do
    person = Person.create!
    person.orders = (0..200).map { Order.create! }
    person.save!
    controller.stub(:current_person).and_return(person)

    benchmark { get :show }
  end
end

def benchmark(&block)
  block.call # prime cache and garbage collector by calling the block twice
  time = Benchmark.realtime { block.call } # feel free to average times
  puts "RUNTIME: #{time} #{self.class.top_level_description}"
end
```

Spry runs automatically after pushing with git, or can be summoned from the root of your Rails app by running:

    $ spry

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
