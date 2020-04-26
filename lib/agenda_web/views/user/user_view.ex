defmodule AgendaWeb.User.UserView do
  use AgendaWeb, :view

  def render("user.json", %{user: user}) do
    %{
      status: "ok",
      data: %{
        name: user.name,
        email: user.email
      }
    }
  end
end
