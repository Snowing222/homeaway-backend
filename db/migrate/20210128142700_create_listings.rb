class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :property_id
      t.integer :price
      t.date :avail_date_begin
      t.date :avail_date_end
      t.integer :avail_period
      t.boolean :trade_mode
      t.boolean :rent_mode
      t.boolean :strict_mode
     

      t.timestamps
    end
  end
end
