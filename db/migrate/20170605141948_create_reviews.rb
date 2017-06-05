class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewable_id
      t.string :reviewable_type
      t.decimal :note
      t.text :description

      t.timestamps
    end
  end
end
