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
    :address,
    :end_date,
    {rewards_attributes: [:title, :body, :amount, :_destroy, :id]}
    )

    if @campaign.save
      redirect_to campaign_path(@campaign), notice: "Campaign Created"
    else
      render :new
    end
  end

  def index
    @campaigns = Campaign.all.order(created_at: :desc)
  end

  def show
    @campaign = Campaign.find params[:id]
    @pledge = Pledge.new
  end

  def index
    if params[:lat]
      @campaigns = Campaign.near([params[:lat], params[:lng]], 50, units: :km)
    else
      @campaigns = Campaign.where.not(latitude: nil, longitude:nil).order(:created_at)
    end
    @markers = Gmaps4rails.build_markers(@campaigns) do |c, m|
      m.lat        c.latitude
      m.lng        c.longitude
      m.infowindow c.title
    end
    # ^ |campaign, marker|
  end

  def destroy
    campaign = Campaign.find params[:id]
    campaign.destroy
    redirect_to campaigns_path, notice: "Campaign Deleted"
  end


end
