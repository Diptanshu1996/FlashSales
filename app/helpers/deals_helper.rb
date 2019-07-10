module DealsHelper

  def calc_discounted_price(total_amount, discount_percent )
    return total_amount if discount_percent.zero?

    calc_discount_percent = discount_percent < 6 ? discount_percent : 5
    (total_amount - (total_amount * 0.01 * calc_discount_percent)).to_i
  end

end
