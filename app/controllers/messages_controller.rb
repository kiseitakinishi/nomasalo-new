class MessagesController < ApplicationController

  #ユーザー同士のやり取りに対するコントローラーです。

  before_action :logged_in_user, only: [:index, :create, :show]

  def index
    @messages = Message.where('receiver_id = ? OR user_id = ?',current_user.id,current_user.id)
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to message_path(@message.receiver_id), notice: "success"
    else
      @messages = Message.all
      flash.now[:alert] = " failed "
      render :show
    end
  end

  def show
    @message = Message.new
    messages_sort = Message.where('receiver_id = ? AND user_id = ? OR receiver_id = ? AND user_id = ?',
      current_user.id, params[:id], params[:id], current_user.id)
    @messages = messages_sort.order(created_at: :asc)
  end

  private
   def message_params
     params.require(:message).permit(:body,:receiver_id)
   end

end
