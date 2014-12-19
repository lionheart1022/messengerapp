class ChangeFieldToContacts < ActiveRecord::Migration
  def change
    rename_column :contacts, :phone, :number
  end
end
