require_relative 'app'
require_relative 'app_init'
require_relative 'menu'
require_relative 'data/data_manager'
require_relative 'data/data_handler'

app = App.new
app_initializer = AppInit.new(app)
app_initializer.start
