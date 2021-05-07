class AddImageToCitizen < ActiveRecord::Migration[6.1]
  def change
    add_column :citizens, :image, :string
  end
end
