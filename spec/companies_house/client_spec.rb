require 'spec_helper'

describe CompaniesHouse::Client do
  subject { described_class.new }

  it 'includes HTTParty' do
    expect(described_class).to include HTTParty
  end

  it 'has a base_uri set to Bankin API endpoint' do
    expect(described_class.base_uri).to eq 'https://api.companieshouse.gov.uk'
  end

  it 'initialises with a private key' do
    expect(subject.options[:basic_auth][:username]).to eq CompaniesHouse::Config.private_key
  end

  describe '#company_search' do
    let(:query) { 'Sage UK' }
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
