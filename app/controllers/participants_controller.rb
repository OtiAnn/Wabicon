class ParticipantsController < ApplicationController
  def index
    @node = Node.find(params[:node_id])
    @participants = User.where( node_id: params[:node_id])
    respond_to do |format|
      format.html
      format.json {render json: @participants, status: :ok }
    end
  end
  def show
    @node = Node.find(params[:node_id])
    @participant = User.find(params[:id])
  end
  def new
    @node = Node.find(params[:node_id])
    @participant = @node.users.build()
  end
  def edit
    @node = Node.find(params[:node_id])
    @participant = User.find(params[:id])
  end
  def create
    @node = Node.find(params[:node_id])
    @participant = User.find(params[:id])
    respond_to do |format|
      if @participant.update(node_id: params[:node_id])
        format.html
        format.json {render json: @node.users, status: :ok }
      else
        format.html
        format.json {render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    @node = Node.find(params[:node_id])
    @participant = @node.users.build(event_params)
    respond_to do |format|
      if @event.update(event_params)
        format.html {redirect_to [@node, @participant], notice: 'Participant was successfully updated.'}
        format.json {render json: @node.users, status: :ok }
      else
        format.html {render :edit}
        format.json {render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @node = Node.find(params[:node_id])
    @participant = User.find(params[:id])
    respond_to do |format|
      if @participant.update(node_id: nil)
        format.html
        format.json {render json: @node.users, status: :ok }
      else
        format.html
        format.json {render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

end
