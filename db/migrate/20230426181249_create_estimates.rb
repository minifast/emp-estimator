class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.string :name, null: false, index: {unique: true}
      t.binary :file, null: false
      t.decimal :length, null: false

      t.timestamps null: false
    end
  end
end
