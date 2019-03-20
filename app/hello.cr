require "crsfml"
require "math"
require "totem"
require "./Config/Tile"
require "./Config/Tileset"
require "./Config/Tilemap"

#require "./Event"
#require "./Component"
#require "./widget/Widget"
#require "./widget/SimpleButton"
#require "./Instance"
#require "./Application"
#
#app = Application.new(SF::VideoMode.new(800,600),"My Window")
#app.vertical_sync_enabled = false
#app.framerate_limit = 60
#app.start

window = SF::RenderWindow.new(SF::VideoMode.new(800,720),"My Window")
window.vertical_sync_enabled = false
window.framerate_limit = 60

#tileset = Tileset.load "resources/pacman.tileset"
tilemap = Tilemap.load "resources/level-1.tilemap"
#tilemap.tt
shape = SF::CircleShape.new(50)
shape.fill_color = SF.color(150, 50, 250)

# set a 10-pixel wide orange outline
shape.outline_thickness = 10
shape.outline_color = SF.color(250, 150, 100)

while window.open?
  # check all the window's events that were triggered since the last iteration of the loop
  while event = window.poll_event
    # "close requested" event: we close the window
    if event.is_a? SF::Event::Closed
      window.close
    end
  end
  window.clear(SF::Color::Black)
#  window.draw(shape)
  window.draw(tilemap)
  window.display
end


