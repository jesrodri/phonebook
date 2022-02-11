class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :number_type
      t.boolean :main_number

      t.timestamps
    end
  end
end
