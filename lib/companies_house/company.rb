module CompaniesHouse
  # Company class to represent a search result retrieved via Companies House API
  class Company

    attr_accessor :company_name, :company_number, :company_status, :company_status_detail,
      :date_of_creation, :date_of_dissolution, :type, :registered_office_address,
      :registered_office_is_in_dispute, :annual_return, :jurisdiction, :undeliverable_registered_office_address,
      :has_been_liquidated, :has_insolvency_history, :has_charges, :etag, :can_file, :accounts, :previous_company_names,
      :officer_summary, :sic_codes, :last_full_members_list_date

    # @param [Hash] options The options to create a Company
    # @option options [String] :name Name of the Company
    # @option options [String] :company_number Company Number of the Company
    # @option options [String] :company_status Company Status of the Company
    # @option options [String] :company_status_detail Company Status Detail of the Company
    # @option options [String] :date_of_creation Date of Creation of the Company
    # @option options [String] :date_of_dissolution Date of Dissolution of the Company
    # more...
    def initialize(options = {})
      @company_name = options[:company_name]
      @company_number = options[:company_number]
      @company_status = options[:company_status]
      @company_status_detail = options[:company_status_detail]
      @date_of_creation = options[:date_of_creation]
      @date_of_dissolution = options[:date_of_dissolution]
      @type = options[:type]
      @registered_office_address = options[:registered_office_address]
      @annual_return = options[:annual_return]
      @jurisdiction = options[:jurisdiction]
      @undeliverable_registered_office_address = options[:undeliverable_registered_office_address]
      @has_been_liquidated = options[:has_been_liquidated]
      @has_insolvency_history = options[:has_insolvency_history]
      @etag = options[:etag]
      @has_charges = options[:has_charges]
      @can_file = options[:can_file]
      @accounts = options[:accounts]
      @previous_company_names = options[:previous_company_names]
      @officer_summary = options[:officer_summary]
      @sic_codes = options[:sic_codes]
      @last_full_members_list_date = options[:last_full_members_list_date]
      @registered_office_is_in_dispute = options[:registered_office_is_in_dispute]
    end
  end
end
