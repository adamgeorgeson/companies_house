module CompaniesHouse
  # Client class used to send requests to the Companies House API
  class Client
    include HTTParty

    base_uri 'https://api.companieshouse.gov.uk'

    attr_accessor :options

    def initialize
      @options = { basic_auth: { username: Config.private_key } }
    end

    # Search for companies
    #
    # @param [String] query The query string
    # @param [Hash] options Optional paramaters
    # @option options [Integer] :items_per_page Items per page
    # @option options [Integer] :start_index Start Index
    def company_search(query, options = {})
      raise 'nil query param' unless query
      self.options[:query] = { q: query}
      self.options[:query][:items_per_page] = options[:items_per_page]
      self.options[:query][:start_index] = options[:start_index]
      self.class.get('/search/companies', self.options)
    end
  end
end
