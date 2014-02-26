require 'spec_helper'

describe JpBank::Bank do
  describe '.find' do
    let(:bank) { JpBank::Bank.find(bank_code) }

    context 'When bank code given as Integer' do
      let(:bank_code) { 36 }
      
      specify 'load the bank information specified by the given code' do
        expect(bank.name).to eq('楽天銀行') 
      end
    end
  end
end
