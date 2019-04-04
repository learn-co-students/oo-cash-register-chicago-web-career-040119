class CashRegister

attr_accessor :discount, :total, :items


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item= []
  end

def add_item(title, price, quantity=1)
  @total += (price*quantity)
  if quantity > 0
    @item << title
  else @item
  end
end

def apply_discount
if discount > 0
  @total -= @total * @discount / 100
  return "After the discount, the total comes to $#{@total}."
else
  return "There is no discount to apply."
end
end

def items
@item
end

def void_last_transaction
 @item.pop()
end

end
