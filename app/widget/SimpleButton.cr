
class SimpleButton < Widget
  @@default_font = SF::Font.from_file("resources/fonts/joystix.ttf")
  @size : SF::Vector2(Int32)
  def initialize(width : Int32, height : Int32 )
    super()
    @size = SF.vector2(width, height)
    @button = SF::RectangleShape.new(SF.vector2(width,height))
    @label = SF::Text.new

    init_label
    init_button
    puts "t3: #{transform}"
  end

  private def init_label
    @label.font = @@default_font
    @label.character_size = 24
    @label.string = "Hello"
    @label.color = SF::Color::Yellow
    @label.set_origin(@size.x/2-@label.local_bounds.width/2,@size.y/2-@label.local_bounds.height/2)
  end

  private def init_button

    @button.fill_color=SF::Color::Black
    @button.outline_color=SF::Color::Red
    @button.outline_thickness=3
    @button.origin={@size.x/2,@size.y/2}
  end

  private def label_dimension()
    @label.local_bounds
  end

  def on_event(event : SF::Event)

  end

  def draw(target : SF::RenderTarget, states : SF::RenderStates)
  states.transform *= transform
    target.draw(@button, states)
#    target.draw(@label, states)
  end

  def move(x : Number, y : Number)
    bt_origin = @button.origin
    puts "origin: #{@button.origin}"
    @button.move(x+origin.x,y+origin.y)
#    @label.move(x+origin.x+@label.origin.x,y+origin.y+@label.origin.y)
  end

  def hover
    @button.fill_color = SF::Color::Green
  end

  def is_within(x : Number, y : Number) : Bool
    minX, minY, rads = @button.position.x-origin.x, @button.position.y-origin.y, @button.rotation * (Math::PI / 180)
    maxX = minX + @size.x * @button.scale.x
    maxY = minY + @size.y * @button.scale.y
    xp, yp = (x-minX) * Math.cos(-rads) - (y-minY)*Math.sin(-rads) +minX, (y-minY)*Math.cos(-rads) + (x-minX)*Math.sin(-rads) + minY
    if minX <= xp && maxX >= xp && minY <= yp && maxY >= yp
      true
    else
      @button.fill_color = SF::Color::Black
      false
    end
  end

  def rotate(angle : Number)
    self.rotation+=angle
    @button.rotate(rotation)
#    @label.rotate(rotation)

  end

end
