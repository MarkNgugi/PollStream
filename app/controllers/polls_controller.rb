class PollsController < ApplicationController
  before_action :set_poll, only: [ :show, :edit, :update, :destroy ]
  def index
    @polls=Poll.all
  end

  def show
    @total_votes = @poll.choices.joins(:votes).count
  end

  def new
    @polls=Poll.new
  end

  def create
    @polls=Poll.create()
    if @polls.save
      redirect_to @polls, notice: "Poll has been created"
    else
      render :new
    end
  end

  def edit
    @polls=Poll.find(params[:id])
  end

  def update
    @polls=Poll.find(params[:id])
    if @polls.save
      redirect_to @polls
    else
      render :edit
    end
  end

  def destroy
    @polls=Poll.find(params[:id])
    @polls.destroy
    redirect_to @polls
  end

  private

  def set_poll
    @polls=Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, choices_attributes: [ :id, :text, :_destroy ])
  end
end
