class CashRegister
  attr_accessor :discount, :count, :total, :last_purchase, :items

  def initialize(discount = nil)
    @total = 0
    @total = total
    @discount = discount
    @items = []
    if @discount
      @discount = 20
    end
  end
  def add_item(title, price, count = 1)
    self.total += price * count
    count.times do
      items << title
    end
  self.last_purchase = price * count
end

def apply_discount
  if @discount
    self.total = (total * ((100 - discount.to_f)/100)).to_i
    "After the discount, the total comes to $#{self.total}."
else
"There is no discount to apply."
end
end
def void_last_transaction
  self.total -= self.last_purchase
end
end
