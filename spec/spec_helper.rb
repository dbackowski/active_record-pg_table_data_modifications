$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_record/pg_table_data_modifications'

ActiveRecord::Base.establish_connection(adapter: 'postgresql',
                                        database: 'active_record-pg_table_data_modifications_test',
                                        username: 'postgres')

load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'