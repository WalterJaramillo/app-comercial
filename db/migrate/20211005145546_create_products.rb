class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image
      t.string :nombre
      t.string :direccion
      t.integer :existencia
      t.decimal :precio
      t.references :categories, foreign_key: true
      t.references :suppliers, foreign_key: true

      t.timestamps
    end
  end
end
