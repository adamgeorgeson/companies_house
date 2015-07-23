module CompaniesHouse
  # SearchResult class to represent a search result retrieved via Companies House API
  class SearchResult

    attr_accessor :name, :company_number, :company_status,
      :address_line_1, :address_line_2, :address_line_3,
      :address_line_4, :postal_code

    # @param [Hash] options The options to create a SearchResult
    # @option options [String] :name Name of the SearchResult
    # @option options [String] :company_number Company Number of the SearchResult
    # @option options [String] :company_status Company Status of the SearchResult
    # @option options [String] :address_line_1 Address Line 1 of the SearchResult
    # @option options [String] :address_line_2 Address Line 2 of the SearchResult
    # @option options [String] :address_line_3 Address Line 3 of the SearchResult
    # @option options [String] :address_line_4 Address Line 4 of the SearchResult
    # @option options [String] :postal_code Postal Code of the SearchResult
    def initialize(options = {})
      @name = options[:name]
      @company_number = options[:company_number]
      @company_status = options[:company_status]
      @address_line_1 = options[:address_line_1]
      @address_line_2 = options[:address_line_2]
      @address_line_3 = options[:address_line_3]
      @address_line_4 = options[:address_line_4]
      @postal_code = options[:postal_code]
    end
  end
end
