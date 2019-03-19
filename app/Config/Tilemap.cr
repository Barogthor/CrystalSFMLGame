
struct TilemapStruct
  include YAML::Serializable
  property tileset : String
  property width : Int32
  property height : Int32
  property layers : Hash(String,String)
end

class Tilemap
  include SF::Drawable

  protected def initialize(file_tileset : String, @width : Int32, @height : Int32)
    @tileset = Tileset.load file_tileset
    @layers = Hash(String,Array(Int32)).new
  end

  def self.load(filename : String)
    tilemap_config = Totem.from_yaml File.read(filename)
    tilemap_struct = tilemap_config.mapping(TilemapStruct)

    tilemap = Tilemap.new(tilemap_struct.tileset,tilemap_struct.width,tilemap_struct.height)
    tilemap_struct.layers.each do |key, layer|
      tilemap.@layers[key]= layer.delete('\n').split(" ").map{|chr| chr.to_i}
    end
    tilemap
  end

  def tt
    @layers.each do |key, layer|
       puts "#{key}: #{layer}"
    end
  end

  def draw(target : SF::RenderTarget, states : SF::RenderStates)
    states.transform.scale(2,2)
    @layers.each do |key, layer|
      if(key!="collision")
        layer.each_with_index do |value, index|
          if value!=0
            states.transform.translate( (index % @width)*16,(index/@height).to_i*16 )
            target.draw(@tileset[value],states)
            states.transform.translate( (index % @width)*16*-1,(index/@height).to_i*16*-1 )
          end
        end
      end
    end
  end
end