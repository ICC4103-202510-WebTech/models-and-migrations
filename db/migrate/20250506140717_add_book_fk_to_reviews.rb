class AddBookFkToReviews < ActiveRecord::Migration[8.0]
  def change
    change_table :reviews do |t|
      t.references :book, foreign_key: true
    end
  end
end
