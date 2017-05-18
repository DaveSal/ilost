class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end
  
  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(messages_params)

    if @message.save
      redirect_to messages_path, notice: "Успешно отправлено сообщение."
    else
      render 'new'
    end
  end

  private

  def messages_params
    params.require(:message).permit(:title, :content)
  end
end
