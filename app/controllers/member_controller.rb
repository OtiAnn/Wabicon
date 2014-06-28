class MemberController < ApplicationController
  def index
    @members = Event.find(params[:event_id]).users.all
    respond_to do |format|
      format.json {render json: @members, status: :ok }
    end
  end

  def show

  end

  def new
  end

  def create
    @event = Event.find(params[:event_id])
    @member = @event.users.build(user_id: parms[:id])
    respond_to do |format|
      if @member.save
        format.html
        format.json {render json: @event.users, status: :ok }
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
    @member = @event.users.delete(user_id: parms[:id])
    respond_to do |format|
      format.html
      format.json {render json: @event.users, status: :unprocessable_entity }
    end
  end
end
