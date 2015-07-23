require 'spec_helper'

describe CompaniesHouse::Config do
  let(:private_key) { 'foo' }
  let(:base_uri) { 'https://foo.bar' }
  let(:config_hash) { { 'private_key' => private_key, 'base_uri' => base_uri } }

  before do
   described_class.configure_from_hash(config_hash)
  end

  after do
    described_class.configure_from_hash(Bcdatabase.load[:prod, :companies_house_config])
  end

  it 'loads private_key' do
    expect(described_class.private_key).to eq private_key
  end

  it 'loads base_uri' do
    expect(described_class.base_uri).to eq base_uri
  end
end
