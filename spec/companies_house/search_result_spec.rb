require 'spec_helper'

describe CompaniesHouse::SearchResult do
  let(:name) { 'Company X' }
  let(:company_number) { '1234' }
  let(:company_status) { 'active' }
  let(:address_line_1) { 'Sage UK HQ' }
  let(:address_line_2) { 'North Park' }
  let(:address_line_3) { 'Newcastle Upon Tyne' }
  let(:address_line_4) { 'Tyne & Wear' }
  let(:postal_code) { 'NE13 9AA' }
  let(:params) { {
    name: name,
    company_number: company_number,
    company_status: company_status,
    address_line_1: address_line_1,
    address_line_2: address_line_2,
    address_line_3: address_line_3,
    address_line_4: address_line_4,
    postal_code: postal_code
  } }

  subject { described_class.new(params) }

  it 'has name attr_accessor' do
    expect(subject.name).to eq name
  end

  it 'has company_number attr_accessor' do
    expect(subject.company_number).to eq company_number
  end

  it 'has company_status attr_accessor' do
    expect(subject.company_status).to eq company_status
  end

  it 'has address_line_1 attr_accessor' do
    expect(subject.address_line_1).to eq address_line_1
  end

  it 'has address_line_2 attr_accessor' do
    expect(subject.address_line_2).to eq address_line_2
  end

  it 'has address_line_3 attr_accessor' do
    expect(subject.address_line_3).to eq address_line_3
  end

  it 'has address_line_4 attr_accessor' do
    expect(subject.address_line_4).to eq address_line_4
  end

  it 'has postal_code attr_accessor' do
    expect(subject.postal_code).to eq postal_code
  end
end
