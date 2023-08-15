require 'json'

class DataManager
  def save_to_json(filename, data)
    File.open(filename, 'w') do |file|
      json_data = JSON.generate(data)
      file.write(json_data)
    end
  end
end
