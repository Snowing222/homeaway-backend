class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.integer :price
      t.string :photo_src
      t.text :description
      t.date :avail_date_begin
      t.date :avail_date_end
      t.integer :avail_period
      t.integer :bedroom_number
      t.integer :bathroom_number
      t.integer :guest_number
      t.boolean :trade_mode
      t.boolean :rent_mode
      t.boolean :strict_mode
      t.string  :address
      t.string  :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
