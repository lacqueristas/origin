class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines, id: :uuid do |table|
      table.text :name, null: false
      table.text :description, null: false, default: ""
      table.uuid :brand_id, null: false, index: true
      table.jsonb :metadata, null: false, default: {}
      table.timestamps null: false

      table.foreign_key :brands, column: :brand_id
    end
  end
end
