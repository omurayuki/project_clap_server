class TeamsController < ApplicationController

  #一般userがteam_idで所属チームを検索するため
  def index
    team = Team.find_by!(team_id: team_params[:team_id])
    render json team, status: :ok
  end

  def create
    team = Team.new(team_params)
      render json: team, status: :ok if team.save!
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