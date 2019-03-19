

class Tile < SF::Sprite
  getter id : Int32
#  @pos: NamedTuple(x: Int32, y: Int32)
#  @size: NamedTuple(x: Int32, y: Int32)

  def initialize(texture : SF::Texture, info : String)
    super(texture)
    split = info.split(" ")
    @id = split[0].to_i
    self.texture_rect = SF.int_rect(split[1].to_i,split[2].to_i,split[3].to_i,split[4].to_i)
#    @pos = {x: split[1].to_i, y: split[2].to_i}
#    @size = {x: split[3].to_i,y: split[4].to_i}
  end

  def to_s
    "{id: #{@id}, position: #{@pos}, size: #{@size}"
  end
end