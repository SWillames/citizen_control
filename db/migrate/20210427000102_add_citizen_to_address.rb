class AddCitizenToAddress < ActiveRecord::Migration[6.1]
  def change
    add_reference :addresses, :citizen, null: false, foreign_key: true
  end
end
