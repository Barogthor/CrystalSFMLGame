
abstract class Widget < Component
  include Event::MouseHover

  abstract def on_event(event : SF::Event)

end