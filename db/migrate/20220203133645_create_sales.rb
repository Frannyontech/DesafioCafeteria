class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :origin
      t.string :blend
      t.decimal :price
      t.datetime :date_sales

      t.timestamps
    end
  end
end
