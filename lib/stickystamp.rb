require 'net/http'
require 'net/https'
require 'json'
require 'uri'
require './recipient'

class StickStamp

  def initialize(apikey)
    @apikey = apikey
    @rootURL = "https://api.stickystamp.com"
  end

  def post(path, json_string)
    uri = URI(@rootURL + path)
    req = Net::HTTP::Post.new uri.path
    req.basic_auth @apikey, ""
    req.body = json_string.to_s
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

end
  
# r = Recipient.new("Sibi","sibi@psibi.in","add1","add2","Chennai","TN","IN","666666","777777777")
# a = StickStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
# a.createRecipient(r)
# a.getSpecificRecipient(r,8)

# RestClient.post "http://api.stickystamp.com/v1/recipients", r.serialize_to_hash.to_json, :content_type => :json, :accept => :json

