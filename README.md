# JpBank

Provide mapping from bank codes to bank information

## Installation

Add this line to your application's Gemfile:

    gem 'jp_bank'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jp_bank

## Usage


```ruby
require 'jp_bank'

bank = JpBank::Bank.find(36)
bank.name #=> "楽天銀行"
bank.code #=> "0036"
```


`JpBank` module provides `jp_bank` class method:

```ruby
class Account
  attr_reader :bank_code
  jp_bank :bank

  def initialize(args)
    ...
    @bank_code = args[:bank_code]
    ...
  end
end

account = Account.new(bank_code: '0036')
account.bank.name #=> '楽天銀行'
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/jp_bank/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
