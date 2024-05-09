class CreateDealerships < ActiveRecord::Migration[7.1]
  def change
    create_table :dealerships do |t|
      t.integer :review_rating
      t.string :days_open
      t.string :city
      t.string :name
      t.boolean :military_discount

      t.timestamps
    end
  end
end
