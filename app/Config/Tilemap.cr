

class Tilemap
  @tileset : Tileset
  @tilemap = Hash(String,Array(Int32)).new

  protected def initialize(file_tileset : String)
    @tileset = Tileset.load file_tileset
  end

  def self.load(filename : String)
    tilemap_config = Totem.from_yaml File.read(filename)
    tilemap = Tilemap.new tilemap_config.get("tileset").as_s
    tilemap_config.get("terrain").as_a?.try &.each do |it|

    end
  end
end