class VotesController < ApplicationController
  include ApiResponseConcern

  before_action :require_employee

  def index
    votes = Vote.group_for_date(Time.zone.now.to_date)
    render json: { votes: votes }, status: :ok
  end

  def create
    new_vote = current_user.votes.new(vote_params)
    render_resource_response(new_vote)
  end

  private

  def vote_params
    params.require(:vote).permit(:menu_id)
  end
end
