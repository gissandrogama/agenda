defmodule AgendaWeb.ConviteView do
  use AgendaWeb, :view

  def render("convite.json", %{convite: convite}) do
    %{
      status: "ok",
      data: %{
        user_id: convite.user_id,
        evento_id: convite.evento_id,
        confirmacao: convite.confirmacao
      }
    }
  end
end
