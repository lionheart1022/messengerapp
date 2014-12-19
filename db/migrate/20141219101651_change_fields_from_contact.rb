class ChangeFieldsFromContact < ActiveRecord::Migration
  def change
    rename_column :contacts, :number, :phone
  end
end
