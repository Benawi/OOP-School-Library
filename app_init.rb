class AppInit
  def initialize
    @app = App.new
  end

  def start
    @app.load_data
    menu = Menu.new(@app)
    menu.display
  end
end
