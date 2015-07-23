module CompaniesHouse
  # Client class used to send requests to the Bankin API
  class Client
    include HTTParty

    base_uri 'https://api.companieshouse.gov.uk'

    attr_accessor :options

    def initialize
      @options = { basic_auth: { username: Config.private_key } }
    end
  end
end
