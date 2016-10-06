defmodule UserManagementExample.PageController do
  use UserManagementExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
