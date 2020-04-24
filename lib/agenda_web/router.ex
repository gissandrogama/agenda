defmodule AgendaWeb.Router do
  use AgendaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AgendaWeb do
    pipe_through :api
  end
end
