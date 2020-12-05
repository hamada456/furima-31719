class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post         , null: false
      t.integer    :send_area_id , null: false
      t.string     :city         , null: false 
      t.string     :block        , null: false
      t.string     :build
      t.string     :tel          , null: false
      t.references :buy          , foreign_key: true
      t.timestamps
    end
  end
end
