class Corrector
    def correct_name(name)
      name = name.slice(0, 10) if name.length > 10
      name.capitalize
    end
  end