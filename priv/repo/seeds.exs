# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserManagementExample.Repo.insert!(%UserManagementExample.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


UserManagementExample.Repo.insert!(%UserManagementExample.Post{title: "MyPost", body: "My Content"})
UserManagementExample.User.changeset(%UserManagementExample.User{}, %{name: "Demo User", email: "admin2@example.com", password: "password", password_confirmation: "password"})
  |> UserManagementExample.Repo.insert!



