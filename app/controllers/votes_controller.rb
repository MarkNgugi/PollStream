class VotesController < ApplicationController
  def create
    @choice = Choice.find(params[:choice_id])
    @vote = @choice.votes.build

    if @vote.save
      redirect_to poll_path(@choice.poll), notice: "Your vote was successfully counted."
    else
      redirect_to poll_path(@choice.poll), alert: "Unable to vote. Please try again."
    end
  end
end
