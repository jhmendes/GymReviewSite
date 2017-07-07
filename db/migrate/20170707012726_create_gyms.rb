class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :description, null: false
    end
  end
end


# ideas from Cary
# price? type of gym? offers?
# .tanning? .personal_training? .babysitting?
