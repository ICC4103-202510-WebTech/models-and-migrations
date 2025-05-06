class AddReviewsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
