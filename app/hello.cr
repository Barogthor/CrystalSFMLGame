require "crsfml"
require "math"
require "./widget/SimpleButton"

window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "My window")
window.vertical_sync_enabled = true # call it once, after creating the window
window.framerate_limit = 60 # call it once, after creating the window
button = SimpleButton.new(200,100)

puts button.is_hover(10,50)
# run the program as long as the window is open
while window.open?
  # check all the window's events that were triggered since the last iteration of the loop
    while event = window.poll_event
        # "close requested" event: we close the window
        if event.is_a? SF::Event::Closed
            window.close
        end
    end
    window.clear(SF::Color::Black)
    window.draw(button)
    window.display
end