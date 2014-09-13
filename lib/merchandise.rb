class Merchandise

  attr_accessor :id, :name, :category, :color,
  :tshirt_type, :dimension, :dimension_unit
    
  def initialize(id, name, category, color=nil,
                 tshirt_type=nil, dimension=nil,
                 dimension_unit=nil)
    @id = id
    @name = name
    @category = category
    @color = color
    @tshirt_type = tshirt_type
    @dimension = dimension
    @dimension_unit = dimension_unit
  end

  def self.serialize_to_Merchandise(hash_data)
    Merchandise.new(hash_data["id"], hash_data["name"],
                    hash_data["category"], hash_data["color"],
                    hash_data["tshirt_type"], hash_data["dimension"],
                    hash_data["dimension_unit"])
  end

  def to_s
    @name + " :" + @category
  end

end
