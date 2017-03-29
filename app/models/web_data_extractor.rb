class WebDataExtractor
  attr_accessor :urls
  def initialize(urls)
    @urls = urls
  end

  def web_data_from_urls
    @web_data_from_urls ||= @urls.each_with_object({}) do |value, memo|
      memo[value] = extract_details(value)
    end
  end

  def mechanize
    @mechanize ||= Mechanize.new
  end
  private :mechanize

  def extract_details(url)
    details = []
    page = mechanize.get(url)
    links = page.links_with(text: 'Ver completo')
    links.each do |link|
      raw_data = link.click
      details.push({ raw_data.uri.to_s => raw_data.search('.col-izk div').first.text })
    end
    details
  end

  def print_found_data
    web_data_from_urls.each do |detail|
      puts detail.inspect
    end
  end
end
