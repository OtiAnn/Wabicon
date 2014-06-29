class MembersController < ApplicationController
  after_action :check_event_empty, only: [:destroy]
  def index
    @members = Event.find(params[:event_id]).event_user_associations
    respond_to do |format|
      format.json {render json: @members, :include => {:user => {:only => :name}}, status: :ok }
    end
  end

  def show

  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @member = @event.event_user_associations.build(user_id: parms[:id])
    respond_to do |format|
      if @member.save
        format.html
        format.json {render json: @event.event_user_associations, :include => {:user => {:only => :name}}, status: :ok }
      else
        format.html
        format.json {render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @event = Event.find(params[:event_id])
    @member = @event.event_user_associations.find_by_user_id(parms[:id]).delete()
    respond_to do |format|
      format.html
      format.json {render json: @event.event_user_associations, :include => {:user => {:only => :name}}, status: :unprocessable_entity }
    end
  end

  private
  def check_event_empty
    if @event.users.size == 0
      @event.destroy
    end
  end
end
