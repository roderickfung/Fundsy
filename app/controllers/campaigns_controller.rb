class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
    #We need to build campaigns in here in order for it to show correctly on the form so we can save wards at the same time we create a campaign
    3.times { @campaign.rewards.build }
  end

  def create
    @campaign = Campaign.new params.require(:campaign).permit(
    :title,
    :description,
    :goal,
    :end_date,
    {rewards_attributes: [:title, :body, :amount, :_destroy, :id]}
    )

    if @campaign.save
      redirect_to campaign_path(@campaign), notice: "Campaign Created"
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.find params[:id]
  end

  def index
    @campaigns = Campaign.order(:created_at)
  end

  def destroy
    campaign = Campaign.find params[:id]
    campaign.destroy
    redirect_to campaigns_path, notice: "Campaign Deleted"
  end


end
