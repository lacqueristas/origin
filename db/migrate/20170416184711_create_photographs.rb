class CreatePhotographs < ActiveRecord::Migration[5.0]
  def change
    create_table :photographs, id: :uuid do |table|
      table.jsonb :variations, default: {}, null: false
      table.uuid :account_id, null: false, index: true
      table.uuid :project_id, null: false, index: true

      table.timestamps null: false, index: true
      table.foreign_key :accounts, column: :account_id
      table.foreign_key :projects, column: :project_id
    end
  end
end
