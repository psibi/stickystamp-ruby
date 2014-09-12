require 'net/http'
require 'net/https'
require 'json'
require 'uri'
require './recipient'
require './shipment'
require './sku'

class StickStamp

  def initialize(apikey)
    @apikey = apikey
    @rootURL = "https://api.stickystamp.com"
  end

  def post(path, json_string)
    uri = URI(@rootURL + path)
    req = Net::HTTP::Post.new uri.path
    req.basic_auth @apikey, ""
    req.body = json_string
    puts json_string
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.ssl_version = :SSLv3
      http.request req
    end
    puts res.body
  end

  def get(path, json_string)
    uri = URI(@rootURL + path)
    req = Net::HTTP::Get.new uri.path
    req.basic_auth @apikey, ""
    req.body = json_string
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.ssl_version = :SSLv3
      http.request req
    end
    res.body
  end
  
  def getSkus()
    response = get("/v1/skus","")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      skus = []
      res_json["skus"].each do |value| 
        skus << Sku.serialize_to_Sku(value) 
      end
      skus
    end
  end

  def getSpecificSku(id)
    response = get("/v1/skus/" + id,"")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Sku.serialize_to_Sku(res_json["sku"])
    end
  end

  def createRecipient(recipient)
    post("/v1/recipients", recipient.serialize_to_hash.to_json)
  end

  def getRecipients(recipient)
    response = get("/v1/recipients", recipient.serialize_to_hash.to_json)
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      recipients = []
      res_json["recipients"].each do |value| 
        recipients << Recipient.serialize_to_Recipient(value) 
      end
      recipients
    end
  end

  def getSpecificRecipient(recipient, id)
    url = "/v1/recipients/" + id.to_s
    response = get(url, recipient.serialize_to_hash.to_json)
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Recipient.serialize_to_Recipient(res_json["recipient"]) 
    end
  end

  def createShipment(shipment)
    post("/v1/shipments", shipment.serialize_to_hash.to_json)
  end

  def getShipments(shipment)
    response = get("/v1/shipments", shipment.serialize_to_hash.to_json)
    res_json = JSON.parse response
    puts res_json
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      shipments = []
      res_json["shipments"].each do |value| 
        shipments << Shipment.serialize_to_Shipment(value) 
      end
      shipments
    end
  end

end
  
#r = Recipient.new("Sibi","sibi@psibi.in","add1","add2","Chennai","TN","IN","666666","777777777")
#a = StickStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
#a.getSpecificRecipient(r,8)
# a.createRecipient(r)
# a.createShipment()

# RestClient.post "http://api.stickystamp.com/v1/recipients", r.serialize_to_hash.to_json, :content_type => :json, :accept => :json

# s = Shipment.new()
# {"contents": [ ["T3-HCKR-V4-S", 1], ["S2-HLGO-V1", 2] ],"recipient": { "name": "isaac", "email": "isaac@stickystamp.com", "contact_number": "888888888", "address1": "12, Krishnan Street", "address2": "West Mambalam", "city": "Chennai", "state": "Tamilnadu", "country": "India", "pincode": "600033" } }' https://api.stickystamp.com/v1/shipments
#  = Recipient.new("Sibi","sibi@psibi.in","add1","add2","Chennai","TN","IN","666666","777777777")

# r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
# s = Shipment.new(r, [ ["T3-HCKR-V4-S", 1], ["S2-HLGO-V1", 2] ])
# a = StickStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
# a.getShipments(s)

# {"id" => @id, "name" => @name, "email" => @email,
#      "address1" => @address1, "address2" => @address2, "city" => @city,
#      "state" => @state, "country" => @country, "pincode" => @pincode,
#       "contact_number" => @contact_number }.reject {|k,v| v == nil}
