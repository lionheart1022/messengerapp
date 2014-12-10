class RemoveFieldsToMessage < ActiveRecord::Migration
  def change
    remove_column :messages, :receiver, :string
    remove_column :messages, :sender, :string
  end
end
