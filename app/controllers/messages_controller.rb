class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @messages = Message.where(receiver_id: current_user.id)
    respond_with(@messages)
  end

  def sent
    @messages = Message.where(sender_id: current_user.id)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    @receivers = User.where.not(id:current_user.id)
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        UserMailer.send_email(@message.sender.email, @message.receiver.email, @message.subject, @message.content)
        format.html { redirect_to(@message, notice: 'User was successfully created.') }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
    @message.save
    #respond_with(@message)
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :content)
    end
end
