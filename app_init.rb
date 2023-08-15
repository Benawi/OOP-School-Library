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

  def save_data_to_files
    @app.save_data_to_files
  end
end
