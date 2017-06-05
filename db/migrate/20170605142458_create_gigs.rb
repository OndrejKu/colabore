class CreateGigs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
      t.references :organization, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :start
      t.datetime :end
      t.integer :number_of_available_candidatures
      t.boolean :available

      t.timestamps
    end
  end
end
