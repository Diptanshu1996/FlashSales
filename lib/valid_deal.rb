module ValidDeal
  def self.is_valid_deal(deal)
    deal_live_timestamp = Time.parse(deal.publish_date.to_s + " " + DEAL_LIVE_TIME).to_i
    deal_end_timestamp = deal_live_timestamp + (24*60*60).to_i
    current_timestamp = Time.now.to_i

    return deal if current_timestamp >= deal_live_timestamp && current_timestamp < deal_end_timestamp
  end
end
