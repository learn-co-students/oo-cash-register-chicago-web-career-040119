
class CashRegister
  attr_accessor :total
  attr_reader :discount

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, qty = 1)
    @total += price * qty
    @cart << {"item_name" => item, "price" => price, "qty" => qty, "total" => qty * price}
  end

  def apply_discount
    if !@discount
      "There is no discount to apply."
    else
      @total *= 1.to_f - (@discount.to_f / 100.to_f)
      @total = @total.to_i
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    cart_items = []
    @cart.each {|item| (item["qty"]).times{cart_items << item["item_name"]}}
    cart_items
  end

  def void_last_transaction
    @cart.pop
    @cart.length > 0 ? @cart.map{|item| @total += item["total"]} : @total = 0.0
  end

end
