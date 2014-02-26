module JpBank
  class Bank
    def self.find(code)
      self.new
    end

    def name
      '楽天銀行' # Fake
    end
  end
end
