module CompaniesHouse
  # Client class used to send requests to the Bankin API
  class Client
    include HTTParty

    base_uri 'https://api.companieshouse.gov.uk'

    attr_accessor :options

    def initialize
      @options = { basic_auth: { username: Config.private_key } }
    end

    def company_search(query, options = {})
      raise 'nil query param' unless query
      self.options[:query] = { q: query}
      self.options[:query][:items_per_page] = options[:items_per_page]
      self.options[:query][:start_index] = options[:start_index]
      self.class.get('/search/companies', self.options)
    end
  end
end
