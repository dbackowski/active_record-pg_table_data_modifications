ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :first_name
    t.string :last_name
  end

  create_table :table_data_modifications, force: true do |t|
    t.string :source_table
    t.json :changed_records
    t.integer :user_id
    t.timestamp :created_at
  end
end