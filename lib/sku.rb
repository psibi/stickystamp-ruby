class Sku

  def initialize(id=nil, category=nil, name=nil, merc_name=nil,
                 merc_id=nil, color=nil, size=nil, tshirt_type=nil,
                 translucent=nil, dimension=nil, dimension_unit=nil)
    @id = id
    @category = category
    @name = name
    @merchandise_name = merc_name
    @merchandise_id = merc_id
    @color = color
    @size = size
    @tshirt_type = tshirt_type
    @translucent = translucent
    @dimension = dimension
    @dimension_unit = dimension_unit
  end

  def serialize_to_hash
    {
      "id" => @id, "category" => @category, "name" => @name,
      "merchandise_name" => @merc_name, "merchandise_id" => merc_id,
      "color" => @color, "size" => @size, "tshirt_type" => @tshirt_type,
      "translucent" => @translucent, "dimension" => @dimension,
      "dimension_unit" => @dimension_unit
    }.reject {|k,v| v == nil}
  end

  def self.serialize_to_Sku(hash_data)
    Sku.new(hash_data["id"],hash_data["category"],hash_data["name"],
            hash_data["merchandise_name"], hash_data["merchandise_id"],
            hash_data["color"], hash_data["size"], hash_data["tshirt_type"],
            hash_data["translucent"], hash_data["dimension"],
            hash_data["dimension_unit"])
  end

  def to_s
    @merchandise_name + " " + @merchandise_id
  end

end
