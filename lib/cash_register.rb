class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total_amount(amount, quatity=1)
    @total += amount * quatity
  end 

  def add_item(title, amount, quantity=1)
    quantity.times do
      items << title
    end
    @last_transaction = total_amount(amount, quantity)
  end

  def apply_discount
    if discount != 0
      @total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @total - @last_transaction
  end
end
