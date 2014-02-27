# encoding: utf-8

require 'spec_helper'

describe JpBank::Bank do
  describe '.find' do
    let(:bank) { JpBank::Bank.find(code_or_name) }

    context 'When bank code given as Integer' do
      let(:code_or_name) { 36 }
      
      specify 'load the bank information specified by the given code' do
        expect(bank.code).to eq('0036')
        expect(bank.name).to eq('楽天銀行') 
      end
    end

    context 'When bank code given as String' do
      let(:code_or_name) { '0036' }
      
      specify 'load the bank information specified by the given code' do
        expect(bank.code).to eq('0036')
        expect(bank.name).to eq('楽天銀行') 
      end
    end

    context 'When bank name given' do
      let(:code_or_name) { '楽天銀行' }
      
      specify 'load the bank information specified by the given code' do
        expect(bank.code).to eq('0036')
        expect(bank.name).to eq('楽天銀行') 
      end

    end
  end

  describe '.codes' do
    specify 'returns an array of codes with 4 digits' do
      JpBank::Bank.codes.each do |code|
        expect(code).to match(/^\d{4}$/)
      end
    end
  end
end
