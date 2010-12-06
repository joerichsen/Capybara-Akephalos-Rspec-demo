class AddZipcodeAndCityToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
  end

  def self.down
    remove_column :users, :city
    remove_column :users, :zipcode
  end
end
