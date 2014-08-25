[![Gem Version](https://badge.fury.io/rb/guard-preek.png)](http://badge.fury.io/rb/guard-preek)
[![Build Status](https://travis-ci.org/joenas/guard-preek.png)](https://travis-ci.org/joenas/guard-preek)
[![Dependency Status](https://gemnasium.com/joenas/guard-preek.png)](https://gemnasium.com/joenas/guard-preek)
[![Coverage Status](https://coveralls.io/repos/joenas/guard-preek/badge.png?branch=master)](https://coveralls.io/r/joenas/guard-preek?branch=master)

# Guard::Preek

Do your refactoring with [Guard](https://github.com/guard/guard) and [Preek](https://github.com/joenas/preek) printing the smells for you. In color!

## Installation

    $ gem install guard-preek

or

    # Add to Gemfile
    gem 'guard-preek'

or install it yourself

    $ git clone git@github.com:joenas/guard-preek.git
    $ cd guard-preek
    $ rake install


## Usage

To generate template:

    $ guard init preek

### Examples
```ruby
guard :preek, run_all_dir: 'lib' do
	watch(/lib\/(.*).rb/)
end
```

### Available options

``` ruby
run_all_dir: 'lib'           # Enter in guard will run Preek on 'lib'
report: :verbose             # Use Preek::VerboseReport, default is QuietReport
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
