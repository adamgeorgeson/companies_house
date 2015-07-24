require 'spec_helper'

describe CompaniesHouse::Client do
  subject { described_class.new }

  let(:query) { 'Sage UK' }

  it 'includes HTTParty' do
    expect(described_class).to include HTTParty
  end

  it 'has a base_uri set to Companies House API endpoint' do
    expect(described_class.base_uri).to eq 'https://companyhouse.herokuapp.com/api/v1'
  end

  it 'initialises with a private key' do
    # expect(subject.options[:basic_auth][:username]).to eq CompaniesHouse::Config.private_key
    expect(subject.options[:query][:api_key]).to eq CompaniesHouse::Config.private_key
  end

  describe '#company' do
    let(:query) { '01045967' }
    it 'creates Company object for result' do
      response = subject.company(query)
      expect(response.class).to be CompaniesHouse::Company
    end
  end

  describe '#search' do
    it 'creates SearchResult objects for each search result' do
      response = subject.search(query)
      expect(response.class).to be Array

      response.each do |r|
        expect(r.class).to be CompaniesHouse::SearchResult
      end
    end
  end

  describe '#company_search' do
    it 'gets list of companies matching query paramater' do
      expect(subject.company_search(query)).to be_truthy
    end

    context 'with nil query param' do
      it 'raises an error' do
        expect{ subject.company_search(nil) }.to raise_error('nil query param')
      end
    end

    context 'with items_per_page param' do
      it 'returns specified amount of items per page' do
        response = subject.company_search(query, items_per_page: 1)
        expect(response['items_per_page']).to eq 1
      end
    end

    context 'with start_index param' do
      it 'returns specified amount of items per page' do
        response = subject.company_search(query, items_per_page: 1, start_index: 2)
        expect(response['start_index']).to eq 2
      end
    end
  end
end
