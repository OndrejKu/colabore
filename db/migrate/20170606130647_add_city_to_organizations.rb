class AddCityToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_reference :organizations, :city, foreign_key: true
  end
end
