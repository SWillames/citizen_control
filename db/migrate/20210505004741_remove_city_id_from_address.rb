class RemoveCityIdFromAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :city_id
  end
end
