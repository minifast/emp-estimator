class CreateMetals < ActiveRecord::Migration[7.0]
  def change
    create_table :metals do |t|
      t.string :name, null: false, index: {unique: true}
      t.monetize :price, null: false


      t.timestamps null: false
    end
  end
end
