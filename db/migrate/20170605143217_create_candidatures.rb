class CreateCandidatures < ActiveRecord::Migration[5.0]
  def change
    create_table :candidatures do |t|
      t.references :gig, foreign_key: true
      t.references :volunteer, foreign_key: true
      t.boolean :accepted
      t.text :introduction_letter

      t.timestamps
    end
  end
end
