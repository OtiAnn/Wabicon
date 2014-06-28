class EventsController < ApplicationController
  def index
    @events = Node.find(params[:node_id]).events.all
    respond_to do |format|
      format.html
      format.json {render json: @events, status: :ok }
    end
  end

  def show
    @node = Node.find(params[:node_id])
    @event = @node.events.find(params[:id])
  end

  def new
    @node = Node.find(params[:node_id])
    @event = @node.events.build()
  end

  def edit
    @node = Node.find(params[:node_id])
    @event = @node.events.find(params[:id])
  end

  def create
    @node = Node.find(params[:node_id])
    @event = @node.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html {render :show}
        format.json {render json: @node.events, status: :ok }
      else
        format.html
        format.json {render json: @events.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @node = Node.find(params[:node_id])
    @event = @node.events.build(event_params)
    respond_to do |format|
      if @event.update(event_params)
        format.html {redirect_to [@node, @event], notice: 'Event was successfully updated.'}
        format.json {render json: @node.events, status: :ok }
      else
        format.html {render :edit}
        format.json {render json: @events.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @node = Node.find(params[:node_id])
    @event = @node.events.find(params[:id]).delete()
    respond_to do |format|
      format.html {redirect_to node_events_path(@node), notice: 'Event was successfully destroyed.'}
      format.json {render json: @node.events, status: :ok }
    end
  end


  private
    def event_params
      params.require(:event).permit(:creator_id, :category_id, :title, :content, :number)
    end

end
