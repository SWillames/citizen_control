class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street
      t.string :complement
      t.string :district
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
