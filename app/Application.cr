
class Application < SF::RenderWindow
  @time_remaining : Int32 = 60*10

  def initialize(video : SF::VideoMode, window_name : String)
    super(video,window_name)
    @instances = [] of Instance
    @current_instance = 0
    @instances << Instance.new(self)

  end

  def start
    while self.open?
      self.clear(SF::Color::Black)
      process_events
      render
      self.display
      self.close if @time_remaining <= 0
      @time_remaining-=1
    end
  end

  def process_events
    while event = self.poll_event
      if event.is_a? SF::Event::Closed
        self.close
      end
      @instances[@current_instance].process_events(event)
    end
  end

  def render
    self.draw(@instances[@current_instance])
  end


end