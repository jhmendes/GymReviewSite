class AddToGymTable < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :price_range, :string, null: false
  end
end
