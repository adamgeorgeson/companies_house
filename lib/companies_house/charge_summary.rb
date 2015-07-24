module CompaniesHouse
  # Charge class to represent a search result retrieved via Companies House API
  class ChargeSummary

    attr_accessor :total_count, :part_satisfied_count, :satisfied_count, :unfiltered_count

    # @param [Hash] options The options to create a Company
    # @option options [Integer] :total_count
    # @option options [Integer] :part_satisfied_count
    # @option options [Integer] :satisfied_count
    # @option options [Integer] :unfiltered_count
    def initialize(options = {})
      @total_count = options[:total_count]
      @part_satisfied_count = options[:part_satisfied_count]
      @satisfied_count = options[:satisfied_count]
      @unfiltered_count = options[:unfiltered_count]
    end
  end
end
