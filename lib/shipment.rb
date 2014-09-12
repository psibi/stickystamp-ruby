# The file represents Shipment module
# (http://stickystamp.com/docs#shipment-desc) of StickStamp API.
#
# Author::    Sibi  (mailto:sibi@psibi.in)
# Copyright:: Copyright (c) 2014 Sibi
# License::   MIT

class Shipment

  attr_reader :recipient, :status, :tracking_url,
  :shipping_charges, :net_amount, :tax, :gross_amount,
  :contents, :id
  
  # Initialize the class with shipment details
  def initialize(recipient, contents=nil, status=nil, tracking_url=nil, 
                 shipping_charges=nil, net_amount=nil, tax=nil, 
                 gross_amount=nil, id=nil, dispatched_at=nil,
                 token=nil)
    @recipient = recipient.serialize_to_hash
    @status = status
    @tracking_url = tracking_url
    @shipping_charges = shipping_charges
    @net_amount = net_amount
    @tax = tax
    @gross_amount = gross_amount
    @contents = contents
    @id = id
    @dispatched_at = dispatched_at
    @token = token.nil? ? token : Token.serialize_to_Token(token)
      
  end

  def serialize_to_hash
    {
      "recipient" => @recipient, "status" => @status,
      "tracking_url" => @tracking_url, "shipping_charges" => @shipping_charges,
      "net_amount" => @net_amount, "tax" => @tax, "gross_amount" => @gross_amount,
      "contents" => @contents, id => @id
    }.reject {|k,v| v == nil}
  end

  def self.serialize_to_Shipment(hash_data)
    Shipment.new(Recipient.serialize_to_Recipient(hash_data["recipient"]), 
                  hash_data["status"], hash_data["tracking_url"],
                  hash_data["shipping_charges"], hash_data["net_amount"], hash_data["tax"],
                  hash_data["gross_amount"], hash_data["contents"], 
                  hash_data["id"])
  end
    
  # Show in pretty form in irb
  def to_s
    @id
  end

end

class Token
  
  def initialize(revoked, from_title, mailed_to, is_valid,
                 token, converted, usewise_counter, expired,
                 expired_on)
    @revoked = revoked
    @from_title = from_title
    @mailed_to = mailed_to
    @is_valid = is_valid
    @token = token
    @converted = converted
    @usewise_counter = usewise_counter
    @expired = expired
    @expired_on = expired_on
  end

  def self.serialize_to_Token(hash_data)
    Token.new(hash_data["revoked"], hash_data["from_title"], 
              hash_data["mailed_to"], hash_data["is_valid"],
              hash_data["token"], hash_data["converted"],
              hash_data["usewise_counter"], hash_data["expired"],
              hash_data["expired_on"])
  end

end
