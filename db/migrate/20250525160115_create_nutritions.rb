class CreateNutritions < ActiveRecord::Migration[8.0]
  def change
    create_table :nutritions do |t|
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
