class MembersController < ApplicationController
  after_action :check_event_empty, only: [:destroy]
  def index
    @event = Event.find(params[:event_id])
    @members = Event.find(params[:event_id]).event_user_associations
    respond_to do |format|
      format.html
      format.json {render json: @members, :include => {:user => {:only => :name}}, status: :ok }
    end
  end

  def show

  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @member = @event.event_user_associations.build(user_id: params[:id])
    respond_to do |format|
      if @member.save
        format.html
        format.json {render json: {state:'you win!'}, :include => {:user => {:only => [:id, :name]}}, status: :ok }
      else
        format.html
        format.json {render json: {state:'Shit!'}, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @event = Event.find(params[:event_id])
    @member = @event.event_user_associations.find_by_user_id(params[:id]).destroy()
    respond_to do |format|
      format.html {redirect_to event_members_path(@event), notice: 'Member was successfully destroyed.'}
      format.json {render json: @event.event_user_associations, :include => {:user => {:only => :name}}, status: :ok }
    end
  end

  private
  def check_event_empty
    if @event.users.size == 0
      @event.destroy
    end
  end
end
