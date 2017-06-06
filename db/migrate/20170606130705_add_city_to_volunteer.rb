class AddCityToVolunteer < ActiveRecord::Migration[5.0]
  def change
    add_reference :volunteers, :city, foreign_key: true
  end
end
