module JpBank
  class Bank
    class NotFound < StandardError; end

    def self.codes
      self.load_banks unless @bank_codes
      @bank_codes.keys
    end
    
    def self.fetch_bank_from_code(code)
      self.load_banks unless @bank_codes
      code = '%04d' % code if code.is_a?(Integer)
      @bank_codes[code]
    end

    def self.fetch_bank_from_name(name)
      self.load_banks unless @bank_names
      @bank_names[name]
    end

    def self.find(code_or_name)
      self.fetch_bank_from_code(code_or_name) or 
        self.fetch_bank_from_name(code_or_name)
    end

    def self.find!(code_or_name)
      bank = find(code_or_name)
      raise NotFound if bank.nil?
      bank
    end

    def initialize(data)
      @data = data
    end

    def code
      @data['code']
    end

    def name
      @data['name']
    end

    private 
    def self.load_banks
      require 'yaml' 

      @banks = data_file_paths.inject([]) do |data, data_path|
        data + YAML.load_file(data_path)
      end.map { |data| new(data) }
      @bank_codes = {}
      @banks.each do |bank|
        @bank_codes[bank.code] = bank
      end
      @bank_names = {}
      @banks.each { |bank| @bank_names[bank.name] = bank }
    end

    def self.data_file_paths
      [ File.expand_path('../../data/banks.yml', __FILE__) ]
    end
  end
end
