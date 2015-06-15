# ActiveRecord::PgTableDataModifications [![Build Status](https://travis-ci.org/dbackowski/active_record-pg_table_data_modifications.svg?branch=master)](https://travis-ci.org/dbackowski/active_record-pg_table_data_modifications)

Very simple gem for storing table data modifications (only for PostgreSQL 9.3 >=). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record-pg_table_data_modifications'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record-pg_table_data_modifications

Generate a migration which will add a table_data_modifications table to your database.

    bundle exec rails generate active_record:pg_table_data_modifications:install

Run the migration.

    bundle exec rake db:migrate

## Usage

```ruby
class User < ActiveRecord::Base
end

user = User.new(first_name: 'John', last_name: 'Doe')
=> #<User id: nil, first_name: "John", last_name: "Doe"> 
user.save
=> true 
user.first_name = 'Sam'
=> "Sam"
user.save
=> true
user.table_data_modifications
=> #<ActiveRecord::Relation [#<ActiveRecord::TableDataModification id: 1, source_table: "users", changed_records: {"before"=>{"first_name"=>"John"}, "after"=>{"first_name"=>"Sam"}}, user_id: nil, created_at: "2015-06-15 09:08:27">]>
```

## Contributing

1. Fork it ( https://github.com/dbackowski/active_record-pg_table_data_modifications/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
