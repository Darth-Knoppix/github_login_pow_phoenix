defmodule GhLoginWeb.AuthController do
  use GhLoginWeb, :controller
  plug Ueberauth

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> clear_session()
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    %{uid: uid} = auth
    %{name: name, image: image, email: email} = auth.info
    new_user = %{name: name, image: image, email: email}

    case IO.inspect(GhLogin.MemStore.get(uid)) do
      nil ->
        GhLogin.MemStore.put(uid, new_user)

        conn
        |> put_flash(:info, "Successfully created user and authenticated.")
        |> put_session(:current_user, new_user)
        |> configure_session(renew: true)
        |> redirect(to: "/")

      user ->
        conn
        |> put_flash(:info, "Successfully authenticated.")
        |> put_session(:current_user, user)
        |> configure_session(renew: true)
        |> redirect(to: "/")
    end
  end
end
