require 'net/http'
require 'net/https'
require 'json'
require 'uri'
require './recipient'
require './shipment'
require './sku'
require './merchandise'
require './grantform'

class StickStamp

  def initialize(apikey)
    @apikey = apikey
    @rootURL = "https://api.stickystamp.com"
  end

  def post(path, json_string)
    uri = URI(@rootURL + path)
    req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
    req.basic_auth @apikey, ""
    req.body = json_string.to_s
    res = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http.ssl_version = :SSLv3
      http.request req
    end
    res.body
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
  
  private :post, :get

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

  def getAllMerchandise
    response = get("/v1/merchandise","")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      merchs = []
      res_json["merchandise"].each do |value|
        merchs << Merchandise.serialize_to_Merchandise(value)
      end
    end
    merchs
  end

  def getSpecificMerchandise(id)
    response = get("/v1/merchandise/" + id, "")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Merchandise.serialize_to_Merchandise(res_json["merchandise"])
    end
  end

  def getSkuByMerchandise(id)
    response = get("/v1/merchandise/" + id + "/skus", "")
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

  def createRecipient(recipient)
    response = post("/v1/recipients", recipient.serialize_to_hash.to_json)
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Recipient.serialize_to_Recipient(res_json["recipient"])
    end
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

  def getSpecificRecipient(id)
    url = "/v1/recipients/" + id.to_s
    response = get(url, "")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Recipient.serialize_to_Recipient(res_json["recipient"]) 
    end
  end

  def createShipment(shipment)
    response = post("/v1/shipments", shipment.serialize_to_hash.to_json)
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Shipment.serialize_to_Shipment(res_json["shipment"])
    end
  end

  def getShipments(shipment)
    response = get("/v1/shipments", shipment.serialize_to_hash.to_json)
    res_json = JSON.parse response
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

  def getSpecificShipment(id)
    response = get("/v1/shipments/" + id, "")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Shipment.serialize_to_Shipment(res_json["shipment"]) 
    end
  end

  def createGrantForm(grantform)
    response = post("/v1/grantforms", grantform.serialize_to_hash.to_json)
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      Shipment.serialize_to_Shipment(res_json["shipment"])
    end
  end    
  
  def getGrantForms
    response = get("/v1/grantforms","")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      gforms = []
      res_json["grantforms"].each do |value| 
        gforms << GrantForm.serialize_to_GrantForm(value) 
      end
      gforms
    end
  end

  def getSpecificGrantForm(id)
    response = get("/v1/grantforms/" + id,"")
    res_json = JSON.parse response
    if res_json["status"] != "success"
      raise "StickyStamp: " + res_json["error"]
    else
      GrantForm.serialize_to_GrantForm(res_json["grantform"]) 
    end
  end

  def to_s
    "API Key: " + @apikey
  end

end
  
