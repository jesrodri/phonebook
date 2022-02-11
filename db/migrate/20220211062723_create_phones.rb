class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :number, null: false
      t.string :number_type
      t.boolean :main_number, null: false
      t.references :contact, foreign_key: true

      t.index [:number, :contact], unique: true
      t.timestamps
    end
  end
end
