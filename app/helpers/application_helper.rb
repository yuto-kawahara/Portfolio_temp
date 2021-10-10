module ApplicationHelper
  
  # 商品ごとの合計価格
  def subtotal_price(item)
    quantities = item.quantity
    pricies = item.product.price
    subtotal_price = add_tax(pricies * quantities)
    return subtotal_price
  end
  
  # 商品全体の合計金額
  def total_price(items)
    total_price = items.pluck(:quantity, :price).sum{ |q, p| q * p }
    total_price = add_tax(total_price)
    return total_price
  end

  # 消費税を加えた商品価格
  def add_tax(price)
    taxed_price = (price * 1.10).round
  end
end
