class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :specialization
      t.references :client, index: true, foreign_key: true

      t.timestamps
    end
  end
end
