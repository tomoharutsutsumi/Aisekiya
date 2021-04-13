class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.decimal :ratio
      t.integer :number_of_women
      t.integer :number_of_men
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end