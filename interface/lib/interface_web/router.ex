defmodule InterfaceWeb.Router do
  use InterfaceWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    # CSRF protection disabled.
    # TODO: Find a workaround without disabling the CSRF protection
    # plug :protect_from_forgery
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", InterfaceWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

    get("/simulation", SimulationController, :index)

    post("/event", SimulationController, :handle_event)
  end

  # Other scopes may use custom stacks.
  # scope "/api", InterfaceWeb do
  #   pipe_through :api
  # end
end
