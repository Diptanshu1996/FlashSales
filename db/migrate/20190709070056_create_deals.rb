class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :discounted_price
      t.integer :quantity
      t.date :publish_date

      t.timestamps
    end
  end
end
