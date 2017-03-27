class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects, id: :uuid do |table|
      table.text :name, null: false, index: true
      table.text :description, null: false, default: ""
      table.timestamp :painted_at, null: false, index: true
      table.uuid :account_id, null: false, index: true

      table.foreign_key :accounts, column: :account_id

      table.timestamps index: true, null: false
    end
  end
end
