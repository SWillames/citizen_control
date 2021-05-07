class DropCities < ActiveRecord::Migration[6.1]
  def change
    drop_table :cities do |t|
      t.string :name
      t.bigint :state_id
    end
  end
end
