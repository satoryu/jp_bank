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

  describe '.find!' do
    context 'When given a valid bank code(name)' do
      let(:bank) { JpBank::Bank.find!('0036') }

      specify 'responds the bank object with the given bank code(name)' do
        expect(bank).to_not be_nil
        expect(bank.name).to eq('楽天銀行')
      end
    end

    context 'When given an invalid bank code(name)' do
      specify 'raises error' do
        expect { JpBank::Bank.find!('invalid code or name') }.to raise_error(JpBank::Bank::NotFound)
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
