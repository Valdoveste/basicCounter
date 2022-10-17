defmodule CounterPurpleWeb.Router do
  use CounterPurpleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CounterPurpleWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", CounterPurpleWeb do
    pipe_through :browser

    live "/", CounterPurpleWebLive
  end

  # scope "/", CounterPurpleWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", CounterPurpleWeb do
  #   pipe_through :api
  # end
end
