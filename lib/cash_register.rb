require "pry"
class CashRegister
  attr_accessor :total, :transaction
  attr_reader :discount


  def initialize(discount = 0)
    @discount = discount.to_f
    @total = 0.00
    @items = []
    @transaction = 0
  end

  def add_item(title, price, quantity = 1)
    
    @total += (price * quantity)

    item = {
      title: title,
      price: price,
      transaction: @transaction += 1
    }

    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if discount > 0
      @total = @total - (@discount/100 * @total)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end

  end

  def items
    @items.map do |item|
      item[:title]
    end
  end

  def get_items_by_transaction(transaction)
    @items.select do |item|
      item[:transaction] == transaction
    end
  end

  def get_total_by_transaction(transaction)
    get_items_by_transaction(transaction).inject(0) do |sum, item|
      sum + item[:price]
    end
  end

  def void_last_transaction
    @total -= get_total_by_transaction(@transaction)

    @items.delete_if do |item|
      item[:transaction] == @transaction
    end

    @transaction -= 1
  end
  
end

# cash1 = CashRegister.new(20)
# cash2 = CashRegister.new
#
# cash2.add_item("eggs", 3, 2)
# cash2.add_item("eggs", 3, 5)
# cash2.add_item("eggs", 3, 3)
# cash2.add_item("eggs", 3)
#
# binding.pry
# "bye"
