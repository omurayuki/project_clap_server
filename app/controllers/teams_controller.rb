class TeamsController < ApplicationController
  before_action :authenticate_user, only: [:index, :update]

  def index
    @team = Team.find(params[:team_id])
    @team
    render json: @team, status: :ok
  end
#現在ログインしているuserのteamのidとupdateしようとしているteamのidが一致しているか確認
  def create
    team = Team.new(team_params)
      render json: team, status: :ok if team.save!
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    render json: team, status: :ok
  end

  private

  def team_params
    params.permit(:team_id, :name, :sports_id, :grade_id)
  end
end