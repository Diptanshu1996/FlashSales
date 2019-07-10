class CreateUserDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_deals do |t|
      t.references :user, foreign_key: true
      t.references :deal, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
