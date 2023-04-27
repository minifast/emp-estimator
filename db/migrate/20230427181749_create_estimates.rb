class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.belongs_to :metal, null: false, index: true

      t.string :name, null: false
      t.binary :file, null: false
      t.decimal :length, null: false
      t.decimal :width, null: false
      t.decimal :height, null: false
      t.string :units, null: false

      t.timestamps null: false
    end
  end
end
