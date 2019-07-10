class Deal < ApplicationRecord
  include ValidDeal

  has_one_attached :image # Used ActiveRecord Storage for Image Upload
  has_one :user_deal

  validates_presence_of attribute_names.reject { |attr| attr =~ /id|created_at|updated_at/i } # Checks Presence of all the fields except id, created_at, and updated_at
  validates_uniqueness_of :publish_date

  def self.todays_deal
    deals = Deal.where(publish_date: Date.today.to_s ).or(Deal.where(publish_date: Date.yesterday.to_s)) # Yesterday deals must be available for today upto 10:00 am

    return if deals.empty?

    valid_deal = nil
    deals.each do |deal|
      valid_deal = ValidDeal::is_valid_deal(deal)
    end
    valid_deal
  end

end
