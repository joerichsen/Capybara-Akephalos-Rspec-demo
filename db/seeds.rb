# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
if Rails.env != 'cucumber' && Rails.env != 'test'
  if Zipcode.count < 1080
    client = Savon::Client.new "http://aws.hvm.dk/GetAddressService/GetAddressService.asmx?wsdl"

    postal_code_list = client.get_post_code_list.to_hash.values.first[:postal_code_list]

    zip_codes = postal_code_list.map do |postal_code_entry|
      Zipcode.find_or_create_by_zipcode_and_city(postal_code_entry[:post_code_identifier], postal_code_entry[:district_name])
    end
  end
end

