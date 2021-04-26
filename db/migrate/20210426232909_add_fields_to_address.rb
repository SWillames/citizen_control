class AddFieldsToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :UF, :string, null: false
    add_column :addresses, :ibge, :string 
  end
end
