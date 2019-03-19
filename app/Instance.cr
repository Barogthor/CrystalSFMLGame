

class Instance
  include SF::Drawable


  def initialize(@window : SF::RenderWindow)
    @drawables = [] of SF::Drawable
    @drawables << SimpleButton.new(200,100)
    @drawables << SF::CircleShape.new
#    @drawables << SF::RectangleShape.new({200,100})
    @background = SF::RectangleShape.new(SF.vector2(@window.size.x, @window.size.y))
    puts "is: #{@drawables[1].is_a?(SimpleButton)}"
#    @drawables[2].as?(SF::RectangleShape).try do |el|
#      el.move(300,150)
#    end
    @drawables[1].as?(SF::CircleShape).try do |el|
      el.radius = 115
      el.position = {285,85}
      el.outline_color = SF::Color::Magenta
      el.outline_thickness = 3
      el.fill_color = SF::Color::Transparent
    end
    @drawables[0].as?(SimpleButton).try &.move(300,150)
#    @drawables[0].as?(SimpleButton).try &.rotate(30)
    @background.texture = SF::Texture.from_file("resources/images/bg1.jpg")
  end

  def process_events(event : SF::Event)
    @drawables.each_with_index do |drawable, index|
      drawable.as?(Event).try &.on_event(event)
    end
  end

  def draw(target : SF::RenderTarget, states : SF::RenderStates)

    mouse = SF::Mouse.get_position(@window)
#    puts "Mouse: #{mouse}"
    target.draw(@background,states)
    @drawables.each_with_index do |drawable, index|
      drawable.as?(Event::MouseHover).try do |el|
        if el.is_within(mouse.x < 0 ? 0 : mouse.x,mouse.y < 0 ? 0 : mouse.y)
          el.hover
#          el.as?(SimpleButton).try &.rotate(2)
        end
      end
      target.draw(drawable, states)
    end
  end
end