class CreateTableDataModifications < ActiveRecord::Migration
  def change
    create_table :table_data_modifications do |t|
      t.string :source_table
      t.json :changed_records
      t.integer :user_id
      t.timestamp :created_at
    end
  end
end
