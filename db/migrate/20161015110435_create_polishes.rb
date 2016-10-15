class CreatePolishes < ActiveRecord::Migration[5.0]
  def change
    create_table :polishes, id: :uuid do |table|
      table.text :name, null: false
      table.text :description, null: false, default: ""
      table.uuid :brand_id, null: false, index: true
      table.uuid :line_id, null: false, index: true
      table.jsonb :metadata, null: false, default: {}
      table.timestamps null: false

      table.foreign_key :brands, column: :brand_id
      table.foreign_key :lines, column: :line_id
    end
  end
end
