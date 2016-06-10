require 'pry'

class CashRegister
  attr_accessor :total, :discount


  def initialize(discount=0)
    @discount = discount
    @total = 0
  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    @total = @total - (@total * discount/100)
    return "After the discount, the total comes to $#{@total}."
  end

  def add_item(title,price,quantity=1)
    @cart ||= []
    quantity.times {@cart << title}
    @total += price * quantity
    @last_transaction = {price: price,title: title,quantity: quantity}

  end

  def items
    @cart
  end

  def void_last_transaction
    @total -= @last_transaction[:price]*@last_transaction[:quantity]
    @last_transaction[:quantity].times {@cart.delete(@last_transaction[:title])}
  end

end



# Add items of varying quantities and prices
# Calculate discounts
# Keep track of what's been added to it
# Void the last transaction