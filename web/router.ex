defmodule UserManagementExample.Router do
  use UserManagementExample.Web, :router
  use Coherence.Router         # Add this

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", UserManagementExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

  scope "/", UserManagementExample do
    pipe_through :protected
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", UserManagementExample do
  #   pipe_through :api
  # end
end
