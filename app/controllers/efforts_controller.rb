class EffortsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html
  respond_to :js, :only => :new

  # POST /efforts
  # POST /efforts.json
  def create
    user = {:user_id => current_user.id}
    @effort = Effort.new(params[:effort].merge!(user))
    create!
  end

  # POST /efforts/1/mark_as_paid
  def mark_as_paid
    @effort = Effort.find(params[:id])
    @effort.update_attributes(:paid_at => Time.now)
    redirect_to user_path(params[:uid])
  end
end
