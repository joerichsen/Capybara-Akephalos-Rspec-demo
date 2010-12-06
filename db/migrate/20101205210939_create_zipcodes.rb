class CreateZipcodes < ActiveRecord::Migration
  def self.up
    create_table :zipcodes do |t|
      t.string :zipcode
      t.string :city

      t.timestamps
    end
  end

  def self.down
    drop_table :zipcodes
  end
end
