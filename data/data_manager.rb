require 'json'

class DataManager
  def save_to_json(filename, data)
    File.open(filename, 'w') do |file|
      json_data = JSON.pretty_generate(data)
      file.write(json_data)
    end
  end

  def load_from_json(filename)
    json_data = File.read(filename)
    JSON.parse(json_data, symbolize_names: true)
  end
end
