class TeamsController < ApplicationController
  before_action :authenticate_user, only: [:index, :update]

  def index
    @team = Team.find(params[:team_id])
    if @team
      render json: @team, status: :ok
    else
      render_json_failure("can't fetch team")
    end
  end
#現在ログインしているuserのteamのidとupdateしようとしているteamのidが一致しているか確認
  def create
    team = Team.new(team_params)
      render json: team, status: :ok if team.save!
  end

  def update
    team = Team.find(params[:id])
    if team.update(team_params)
      render json: team, status: :ok
    else
      render_json_failure("can't update")
    end
  end

  

  private

  def team_params
    params.permit(:team_id, :name, :sports_id, :grade_id)
  end
end

#監督などはteamを編集できる機能
#全userにteamIDとuserToken配ることでアプリを再現できる
#sportsとgradeはstringで受け取る そしてそれぞれのtableで保存して, idをteamsに保存
#userにはteamIdではなく、teamのIDを割り当てる