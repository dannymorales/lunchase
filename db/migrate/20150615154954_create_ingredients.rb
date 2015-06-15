class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :ingredients
      t.integer :lunch_special_id

      t.timestamps null: false
    end
  end
end
