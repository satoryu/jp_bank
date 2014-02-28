require "jp_bank/version"

module JpBank
  autoload :Bank, File.expand_path('../jp_bank/bank', __FILE__)

  def self.included(base)
    base.extend JpBank::ClassMethods
  end

  module ClassMethods
    def jp_bank(attr_name, options={})
      bank_code_method = options[:bank_code] || :bank_code

      self.class_eval do
        define_method attr_name do
          JpBank::Bank.find(self.send(bank_code_method))
        end
      end
    end
  end
end
