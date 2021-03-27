class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.decimal :ratio
      t.integer :number_of_women
      t.integer :number_of_men
      t.string :shop_name

      t.timestamps
    end
  end
end
