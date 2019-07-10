class HomepageController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  include ValidDeal

  def index
    @deal = Deal.todays_deal
    @user_deal = UserDeal.where(user_id: current_user.id, deal_id: @deal.id).first if @deal
  end

  def handle_buy_now
    @deal = Deal.find(params[:deal_id])

    if ValidDeal::is_valid_deal(@deal)
      user_deal = UserDeal.where(user_id: current_user.id, deal_id: @deal.id).first_or_create
      user_deal.quantity += 1 # params[:quantity] for more than 1 quantity

      respond_to do |format|
        if user_deal.save!
          @deal.quantity -= 1
          @deal.save!
          format.html { redirect_to '/', notice: 'Congratulations.' }
        else
          format.html { redirect_to '/', notice: 'Sorry, Something went wrong' }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Sorry, This Deal has expired' }
      end
    end
  end

end
