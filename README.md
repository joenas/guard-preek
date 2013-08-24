# Guard::Preek

Do your refactoring with Guard and Preek printing the smells for you. In color!

## Installation

    $ gem install guard-preek
    
or

    # Add to Gemfile
    gem 'guard/preek'

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
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
