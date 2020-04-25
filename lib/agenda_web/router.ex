defmodule AgendaWeb.Router do
  use AgendaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", AgendaWeb do
    pipe_through :api

    post("/users", UserController, :create)
  end
end
