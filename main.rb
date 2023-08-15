require_relative 'app'
require_relative 'app_init'
require_relative 'menu'

app_initializer = AppInit.new

at_exit do
  app_initializer.save_data_to_files
end

app_initializer.start
