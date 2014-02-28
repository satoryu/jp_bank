require 'spec_helper'

describe JpBank do
  describe '.jp_bank' do
    context 'Without any options' do
      let(:klass) do
        klass = Class.new do
          include JpBank
          jp_bank :bank

          def bank_code
            '0036'
          end
        end
        klass
      end

      specify 'generates bank method' do
        expect(klass.new.bank.code).to eq('0036')
      end
    end

    context 'When specified method name by option' do
      let(:klass) do
        klass = Class.new do
          include JpBank
          jp_bank :bank, bank_code: :b_code

          def b_code
            '0036'
          end
        end
        klass
      end

      specify 'generates bank method' do
        expect(klass.new.bank.code).to eq('0036')
      end
    end
  end
end
