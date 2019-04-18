class TeamsController < ApplicationController

  def create
    team = Team.new(team_params)
    if team.save
      render json: team, status: :ok
    else
      render_json_failure("can't save team data")
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_id, :name, :sports_id, :grade_id)
  end
end

#監督などはteamを編集できる機能
#全userにteamIDとuserToken配ることでアプリを再現できる
#sportsとgradeはstringで受け取る そしてそれぞれのtableで保存して, idをteamsに保存
#userにはteamIdではなく、teamのIDを割り当てる