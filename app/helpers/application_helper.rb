module ApplicationHelper
  
  # 商品ごとの合計価格
  def total_price(money, quantity)
    total_price = money * quantity
    total_price.to_s(:delimited)
  end
  
  # 消費税を加えた商品価格
  def add_tax(money)
    taxed_price = (money * 1.10).round
  end
end
