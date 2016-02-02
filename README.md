# ValidatorMultipleUniqueness

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validator_multiple_uniqueness'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validator_multiple_uniqueness

## Usage

Rails default:
```validates :name, uniqueness: true``` validate scope one column
```validates :name, uniqueness: {scope: [:phone, :address]}``` validate check multiple column arcoss records

In gem **validator_multiple_uniqueness**:
```ruby
validates :name, uniqueness_multiple: {scope: [:alias_name1, :alias_name2]}
```
check column **:name or :alias_name1 or :alias_name2** is unique arcoss multiple column in one record and all records in table

## Rails Internationalization
To customize message

```ruby
#config/locales/ja.yml
ja:
  activerecord:
    errors:
      messages:
        uniqueness_multiple: 'はすでに存在します。'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/validator_multiple_uniqueness. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

