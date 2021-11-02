class AddClientIdToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :client_id, :integer, index: true
    add_foreign_key :doctors, :users, column: :client_id
  end
end
