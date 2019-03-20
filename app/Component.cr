abstract class Component < SF::Transformable
  include SF::Drawable
  include Event

  def initialize
    super
  end

  abstract def on_event(event : SF::Event)

  def draw(target : SF::RenderTarget, states : SF::RenderStates)
    states.transform *= transform
    target.draw(self, states)
  end

end