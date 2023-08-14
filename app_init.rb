class AppInit
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Library App!'
    menu = Menu.new(@app)
    menu.display
    exit_app
  end

  def exit_app
    puts 'Thank you for using this App.'
  end
end
