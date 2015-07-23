require 'spec_helper'

describe CompaniesHouse::Client do
  subject { described_class.new }
  before do
    allow(CompaniesHouse::Config).to receive(:private_key).and_return('foo')
    allow(CompaniesHouse::Config).to receive(:base_uri).and_return('bar')
  end

  it 'includes HTTParty' do
    expect(described_class).to include HTTParty
  end

  it 'has a base_uri set to Bankin API endpoint' do
    expect(described_class.base_uri).to eq 'https://api.companieshouse.gov.uk'
  end

  it 'initialises with a private key' do
    expect(subject.options[:basic_auth][:username]).to eq 'foo'
  end
end
