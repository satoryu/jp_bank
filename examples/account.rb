# encoding: utf-8

class Account
  include JpBank

  jp_bank :bank

  attr_reader :bank_code

  def initialize(args={})
    @bank_code = args[:bank_code] || '0001'
  end
end

account = Account.new(bank_code: '0036')

account.bank.name #=> '楽天銀行'
