class GrantForm

  attr_accessor :id, :token, :url, :is_valid, :converted,
  :expires_on, :mailed_to, :from_title, :choices, :shipment,
  :revoked, :expired

  def initialize(contents=nil, recipient=nil,
                 id=nil, token=nil, url=nil, is_valid=nil,
                 converted=nil, expires_on=nil, mailed_to=nil,
                 from_title=nil, choices=nil, shipment=nil, revoked=nil,
                 expired=nil)
    @contents = contents
    @recipient = recipient.nil? ? nil : recipient.serialize_to_hash
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

  def serialize_to_hash
    {
      "contents" => @contents, "recipient" => @recipient, "id" => @id,
      "token" => @token, "url" => @url, "is_valid" => @is_valid,
      "converted" => @converted, "expires_on" => @expires_on,
      "mailed_to" => @mailed_to, "from_title" => @from_title,
      "choices" => @choices, "shipment" => @shipment, "revoked" => @revoked,
      "expired" => @expired
    }.reject {|k,v| v == nil}
  end

  def self.serialize_to_GrantForm(hash_data)
    GrantForm.new(hash_data["contents"], 
                  hash_data["recipient"].nil? ? nil : Recipient.serialize_to_Recipient(hash_data["recipient"]), 
                  hash_data["id"], hash_data["token"], hash_data["url"],
                  hash_data["is_valid"], hash_data["converted"], hash_data["expires_on"],
                  hash_data["mailed_to"], hash_data["from_title"], hash_data["choices"],
                  hash_data["shipment"], hash_data["revoked"], hash_data["expired"])
  end

  def to_s
    @id
  end

end

  

