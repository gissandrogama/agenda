defmodule AgendaWeb.User.SessionView do
  use AgendaWeb, :view

  def render("session.json", %{user: user, token: token}) do
    %{
      status: "ok",
      data: %{
        name: user.name,
        token: token
      }
    }
  end
end
