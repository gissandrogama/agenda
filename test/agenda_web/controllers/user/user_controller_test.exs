defmodule AgendaWeb.User.UserControllerTest do
  use AgendaWeb.ConnCase, async: true

  describe "create/2" do
    test "returns 200 when a user create sucess", %{conn: conn} do
      conn =
        post(conn, "/api/v1/users", %{"name" => "Gissandro Gama", "email" => "gissandro@gmail.com", "password" => "123456"})

      assert %{"status" => "ok", "data" => %{"name" => "Gissandro Gama", "email" => "gissandro@gmail.com"}} =
               json_response(conn, 201)
    end
  end
end
