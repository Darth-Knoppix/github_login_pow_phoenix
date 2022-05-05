defmodule GhLoginWeb.PageController do
  use GhLoginWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
