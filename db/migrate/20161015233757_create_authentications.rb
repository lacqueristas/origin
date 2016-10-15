class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications, id: :uuid do |table|
      table.text :ᵽublic, null: false, index: true
      table.text :ᵽrivate, null: false
      table.text :provider, null: false, index: true
      table.uuid :account_id, null: false, index: true
      table.jsonb :metadata, null: false, default: {}
      table.timestamps null: false

      table.foreign_key :accounts, column: :account_id
      table.index [:provider, :account_id], unique: true
      table.index [:ᵽublic, :provider], unique: true
    end
  end
end
