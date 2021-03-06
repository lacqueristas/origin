class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts, id: :uuid do |table|
      table.text :name, null: false
      table.text :email, null: false, index: {unique: true}
      table.text :encrypted_password, null: false
      table.jsonb :metadata, null: false, default: {}
      table.timestamps null: false
    end
  end
end
