require_relative 'app'

class AppInit
  def initialize(app)
    @app = app
  end

  def start
    @app.load_data
    menu = Menu.new(@app)
    menu.display
  end
end
