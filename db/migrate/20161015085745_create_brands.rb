class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands, id: :uuid do |table|
      table.text :name, null: false
      table.text :description, null: false, default: ""
      table.jsonb :metadata, null: false, default: {}
      table.timestamps null: false
    end
  end
end
