class AddReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content, null: false
      t.integer :user_id, null: false
      t.integer :gym_id, null: false
    end
  end
end
