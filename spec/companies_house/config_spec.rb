require 'spec_helper'

describe CompaniesHouse::Config do
  let(:private_key) { 'foo' }
  let(:config_hash) { {'private_key' => private_key} }

  before do
   described_class.configure_from_hash(config_hash)
  end

  after do
    described_class.configure_from_hash(Bcdatabase.load[:prod, :companies_house_config])
  end

  it 'sets up private_key method' do
    expect(described_class.private_key).to eq private_key
  end
end
