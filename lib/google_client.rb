require "net/http"

class GoogleClient
  def initialize(url = "http://google.com")
    @uri = URI(url)
  end

  def get
    puts "***** Look ma, I'm in the google client!"
    require "pry"; binding.pry
    Net::HTTP.get_response(@uri).body
  end
end

