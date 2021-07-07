require "pry"

class CashRegister
  attr_reader :total
  attr_accessor :discount, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def total=(val)
    @total = val
  end

  def add_item(title, price, qt = 1)
    @total += price * qt
    @transactions << price * qt
    count = 0
    while count < qt
      @items << title
      count += 1
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      disc = 1.00 - (@discount.to_f/100.to_f)
      @total *= disc.to_f
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @transactions.pop
  end


end


jack = CashRegister.new(10)
#binding.pry
wut = "wut"
