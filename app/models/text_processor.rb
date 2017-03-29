class TextProcessor
  def initialize(web_data)
    @web_data = web_data
  end

  def get_text
    text = @web_data.search('.col-izk').text
    text.gsub!(/\n/, "")
    text.gsub!(/\r/, "")
    text.gsub!(/\t/, "")
    entries = text.split("      ")
    entries = remove_white_spaces(entries)
    entries = strip_text(entries)
  end

  def remove_white_spaces(entries)
    entries = entries.reject { |entry| entry.blank? }
    entries
  end

  def strip_text(entries)
    entries = entries.map { |entry| entry.strip }
    entries
  end
end
