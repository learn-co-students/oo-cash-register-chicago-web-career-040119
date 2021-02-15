class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += (price*quantity)
    if quantity > 0
      quantity.times do
        items << title
      end
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0
     @total -= (@total * @discount / 100).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
