class EventsController < ApplicationController
  def index
    @events = Node.find(params[:node_id]).events.all
    respond_to do |format|
      format.html
      format.json {render json: @events, status: :ok }
    end
  end

  def show

  end

  def create
    @node = Node.find(params[:node_id])
    @events = @node.events.build(event_params)
    respond_to do |format|
      if @events.save
        format.html
        format.json {render json: @node.events, status: :ok }
      else
        format.html
        format.json {render json: @events.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @node = Node.find(params[:node_id])
    @event = @node.events.delete(events_id: parms[:id])
    respond_to do |format|
      format.html
      format.json {render json: @node.events, status: :ok }
    end
  end


  private
    def event_params
      params.permit(:creator_id, :category_id, :title, :content, :number)
    end

end
