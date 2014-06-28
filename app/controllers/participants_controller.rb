class ParticipantsController < ApplicationController
  def index
    @users = Node.find(uuid: params[:node_id]).users.all
    respond_to do |format|
      format.json {render json: @users, status: :ok }
    end
  end
  def create
    @node = Node.find(uuid: params[:node_id])
    @participant = @node.users.build(user_id: parms[:id])
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
    @node = Node.find(uuid: params[:node_id])
    @participant = @node.users.delete(user_id: parms[:id])
    respond_to do |format|
      format.html
      format.json {render json: @node.users, status: :unprocessable_entity }
    end
  end

end