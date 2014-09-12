# The file represents Recipient
# (http://stickystamp.com/docs#recipient-desc) of StickStamp API.
#
# Author::    Sibi  (mailto:sibi@psibi.in)
# Copyright:: Copyright (c) 2014 Sibi
# License::   MIT

require 'httpclient'
require 'json'

class Recipient

  # Initialize the class with recipient details
  def initialize(name, email, address1, address2, city, state,
                 country, pincode, contact_number, id=nil)
    @name = name
    @email = email
    @address1 = address1
    @address2 = address2
    @city = city
    @state = state
    @country = country
    @pincode = pincode
    @contact_number = contact_number
    @id = id
  end

  def serialize_to_hash
    {"id" => @id, "name" => @name, "email" => @email,
     "address1" => @address1, "address2" => @address2, "city" => @city,
     "state" => @state, "country" => @country, "pincode" => @pincode,
      "contact_number" => @contact_number }.reject {|k,v| v == nil}
  end

  def self.serialize_to_Recipient(hash_data)
    Recipient.new(hash_data["name"], hash_data["email"], hash_data["address1"],
                  hash_data["address2"], hash_data["city"], hash_data["state"],
                  hash_data["country"], hash_data["pincode"], hash_data["contact_number"],
                  hash_data["id"])
  end
    
  #Show in pretty form in irb
  def to_s
    @name + " " + @email
  end

end

    
