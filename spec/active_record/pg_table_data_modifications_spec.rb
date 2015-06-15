require 'spec_helper'

describe ActiveRecord::PgTableDataModifications do
  it 'modify user create record in table_data_modifications table' do
    user = User.create(first_name: 'John', last_name: 'Doe')

    expect {
      user.first_name = 'Sam'
      user.save
    }.to change(TableDataModification, :count).by(1)
  end
end
