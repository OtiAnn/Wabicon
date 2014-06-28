class ParticipantsController < ApplicationController
  def index
    @node = Node.find(params[:node_id])
    @users = User.find_by_node_id(params[:node_id])
    respond_to do |format|
      format.json {render json: @users, status: :ok }
    end
  end
  def create
    @node = Node.find(params[:node_id])
    @participant = @node.users.build(user_id: params[:id])
    respond_to do |format|
      if @participant.save
        format.html
        format.json {render json: @node.users, status: :ok }
      else
        format.html
        format.json {render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @node = Node.find(params[:node_id])
    @participant = @node.users.delete(user_id: params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @node.users, status: :unprocessable_entity }
    end
  end

end
