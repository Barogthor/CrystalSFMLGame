
module Event
    abstract def on_event(event : SF::Event)

    module MouseHover
      include Event
        abstract def hover
        abstract def is_within(x : Number, y : Number) : Bool
        abstract def on_event(event : SF::Event)

    end

    module MouseClick
      include Event
    end

end

