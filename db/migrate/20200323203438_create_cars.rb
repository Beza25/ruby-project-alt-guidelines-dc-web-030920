class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.float :price
      t.string :status
      t.integer :customer_id
      t.integer :dealership_id
      t.timestamps
    end
  end
end
