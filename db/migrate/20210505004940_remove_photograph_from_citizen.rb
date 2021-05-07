class RemovePhotographFromCitizen < ActiveRecord::Migration[6.1]
  def change
    remove_column :citizens, :photograph
  end
end
