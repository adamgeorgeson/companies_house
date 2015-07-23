module CompaniesHouse
  # Client class used to send requests to the Companies House API
  class Client
    include HTTParty

    # base_uri 'https://api.companieshouse.gov.uk'
    base_uri 'https://companyhouse.herokuapp.com/api/v1'

    attr_accessor :options

    def initialize
      # @options = { basic_auth: { username: Config.private_key } }
      @options = { query: { api_key: Config.private_key } }
    end

    # Search for companies
    #
    # @param [String] query The query string
    # @param [Hash] options Optional paramaters
    # @option options [Integer] :items_per_page Items per page
    # @option options [Integer] :start_index Start Index
    #
    # @return [Array] Array of search results
    def search(query, options = {})
      results = company_search(query, options = {})['items']
      results.map do |r|
        attributes = {
          name: r['title'],
          company_number: r['company_number'],
          company_status: r['company_status'],
          address_line_1: r['address']['address_line_1'],
          address_line_2: r['address']['address_line_2'],
          address_line_3: r['address']['locality'],
          address_line_4: r['address']['region'],
          postal_code: r['address']['postal_code']
        }

        SearchResult.new(attributes)
      end
    end

    # Search for companies
    #
    # @param [String] query The query string
    # @param [Hash] options Optional paramaters
    # @option options [Integer] :items_per_page Items per page
    # @option options [Integer] :start_index Start Index
    def company_search(query, options = {})
      raise 'nil query param' unless query
      self.options[:query][:q] = query
      self.options[:query][:items_per_page] = options[:items_per_page]
      self.options[:query][:start_index] = options[:start_index]
      # self.class.get('/search/companies', self.options)
      get('/companies')
    end

    # Find extended company information
    #
    # @param company_number [String] company house reference number
    # @return [Company] Company object
    def company(company_number)
      result = get("/companies/#{company_number}")
      attributes = Hash[result.map { |k,v| [k.to_sym, v] }]
      Company.new(attributes)
    end

    private

    def get(path)
      self.class.get(path, self.options)
    end
  end
end
