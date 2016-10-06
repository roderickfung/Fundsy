class PublishingsController < ApplicationController
  def create
    campaign = Campaign.find params[:campaign_id]
    if campaign.publish!
      redirect_to campaign, notice: 'Campaign published'
    else
      redirect_to campaign, alert: 'Could not publish'
    end
  end
end
