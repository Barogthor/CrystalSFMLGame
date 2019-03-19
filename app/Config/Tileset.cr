
class Tileset
#  @aliases = Hash(String, String).new
  @tiles= Hash(String, Tile).new
  @pair= Hash(Int32, String).new
  @texture : SF::Texture
  protected def initialize(texture_file : String)
    @texture = SF::Texture.from_file texture_file
  end

  def self.load(filename : String) : Tileset
    tileset_config = Totem.from_yaml File.read(filename)
    tileset = Tileset.new tileset_config.get("texture").as_s
    tileset_config.each do |key,value|
      tileset.build_key("",value) if key=="tiles"
    end
    tileset
  end

  def build_key(key : String, value : Totem::Any )
    it = value.as_a?
    it = value.as_h? if it.nil?
    if it == nil
      @tiles[key]= Tile.new(@texture,value.as_s?||"")
      tmp = @tiles[key]
      @pair[tmp.id]= key
    else
      if it.is_a?(Hash)
        it.try &.each do |ikey,ivalue|
          unless key.size == 0
            build_key("#{key}-#{ikey}",ivalue)
          else
            build_key("#{ikey}",ivalue)
          end
        end
      else
        it.try &.each do |ivalue|
          build_key(key, ivalue)
        end
      end
    end

  end

  def [](key : Int32)
    self[@pair[key]]
  end

  def [](key : String)
    @tiles[key]
  end

end