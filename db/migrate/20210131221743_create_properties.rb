class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :photo_src
      t.text :description
      t.integer :bedroom_number
      t.integer :bathroom_number
      t.integer :guest_number
      t.string  :address
      t.string  :state
      t.integer :zipcode


      t.timestamps
    end
  end
end
