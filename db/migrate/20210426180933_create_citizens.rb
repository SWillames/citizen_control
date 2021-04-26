class CreateCitizens < ActiveRecord::Migration[6.1]
  def change
    create_table :citizens do |t|
      t.string :full_name
      t.string :cpf
      t.string :email
      t.date :birth_date
      t.string :telephone
      t.string :photograph
      t.string :status

      t.timestamps
    end
  end
end
