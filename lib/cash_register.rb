require "pry"

class CashRegister

attr_accessor :discount, :total, :items, :last_transaction
#attr_reader :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @total
    @last_transaction = price * quantity
    quantity.times do
    @items << title
  end
  end

  def apply_discount
    if @discount != 0
    self.total = (@total * ((100.0 - @discount.to_f)/100.0)).to_i
    "After the discount, the total comes to $#{self.total}."
  else
    "There is no discount to apply."
  end
end

  def void_last_transaction
    @total = @total - @last_transaction
end


end
