class MessagesController < ApplicationController
  def contact
    @message = Message.new
  end

  def create
    @message = Message.new(contact_params)

    MessageMailer.new_message(@message).deliver
    redirect_to contact_path, notice: "Your messages has been sent."
  end

  def register
    @message = Message.new
  end

  def register_send
    @message = Message.new(register_params)

    MessageMailer.new_register(@message).deliver
    redirect_to register_path, notice: "Your messages has been sent."
  end

  private

    def contact_params
      params.require(:message).permit(:name, :email, :content)
    end

    def register_params
      params.require(:message).permit(:name, :email, :place_name, :phone, :address, :content)
    end
end
