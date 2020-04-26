defmodule AgendaWeb.Router do
  use AgendaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_as_user do
    plug :accepts, ["json"]
    plug ClaimWeb.AuthAccessPipeline
  end

  scope "/api/v1", AgendaWeb do
    pipe_through :api

    post("/users", User.UserController, :create)
    post("/users/sign_in", User.SessionController, :create)
  end
end
