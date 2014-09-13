class GrantForm

  def initialize(id=nil, token=nil, url=nil, is_valid=nil,
                 converted=nil, expires_on=nil, mailed_to=nil,
                 from_title=nil, choices=nil, shipment=nil, revoked=nil,
                 expired=nil)
    @id = id
    @token = token
    @url = url
    @is_valid = is_valid
    @converted = converted
    @expires_on = expires_on
    @mailed_to = mailed_to
    @from_title = from_title
    @choices = choices
    @shipment = shipment.nil? ? shipment : Shipment.serialize_to_Shipment(shipment)
    @revoked = revoked
    @expired = expired
  end

  def self.serialize_to_GrantForm(hash_data)
    GrantForm.new(hash_data["id"], hash_data["token"], hash_data["url"],
                  hash_data["is_valid"], hash_data["converted"], hash_data["expires_on"],
                  hash_data["mailed_to"], hash_data["from_title"], hash_data["choices"],
                  hash_data["shipment"], hash_data["revoked"], hash_data["expired"])
  end

  def to_s
    @id
  end

end

  

