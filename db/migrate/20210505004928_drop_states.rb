class DropStates < ActiveRecord::Migration[6.1]
  def change
    drop_table :states do |t|
      t.string  :name
      t.string :abbr
    end
  end
end
