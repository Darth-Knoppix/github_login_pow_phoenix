defmodule GhLoginWeb.PageController do
  use GhLoginWeb, :controller

  def index(conn, _params) do
    current_user = get_session(conn, :current_user)
    all_users = GhLogin.MemStore.list()
    render(conn, "index.html", %{current_user: current_user, all_users: all_users})
  end
end
