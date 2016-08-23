class PledgesController < ApplicationController
  before_action :authenticate_user!

  def create
    @pledge = Pledge.new pledge_params
    @campaign = Campaign.find params[:campaign_id]
    @pledge.user = current_user
    @pledge.campaign = @campaign
    if @pledge.save
      redirect_to campaign_path(params[:campaign_id])
    else
      render "campaigns/show"
    end
  end

  def destroy
    pledge = Pledge.find params[:id]
    pledge.destroy
    redirect_to root_path
  end


  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end
end
