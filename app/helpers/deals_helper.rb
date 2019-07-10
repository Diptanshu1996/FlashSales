module DealsHelper

  def calc_discounted_price(total_amount, discount_percent)
    return total_amount if discount_percent.zero?
    (total_amount - (total_amount * 0.01 * discount_percent)).to_i
  end

end
