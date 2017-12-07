class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :body
      t.references :post, foreign_key: true
    end
  end
end
