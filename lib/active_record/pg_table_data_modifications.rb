require 'active_record'
require 'active_record/pg_table_data_modifications/version'
require 'active_record/table_data_modification'

module ActiveRecord
  module PgTableDataModifications
    extend ActiveSupport::Concern

    included do
      before_save :insert_to_table_data_modifications, unless: :new_record?
    end

    def insert_to_table_data_modifications
      atr = { before: {}, after: {} }

      changes.each do |name, values|
        atr[:before][name] = values[0]
        atr[:after][name] = values[1]
      end

      ActiveRecord::TableDataModification.create(source_table: self.class.table_name, changed_records: atr,
                                                 created_at: Time.now)
    end

    def table_data_modifications
      TableDataModification.where(source_table: self.class.table_name).order(created_at: :desc)
    end
  end
end

ActiveRecord::Base.send :include, ActiveRecord::PgTableDataModifications