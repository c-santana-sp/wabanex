defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{"result" => %{"Buscapé" => 25.95155709342561, "Nego Drama" => 27.68166089965398, "Zé galinha" => 17.77777777777778, "Zé pequeno" => 23.437499999999996}}

      assert expected_response == response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "wrong.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

      expected_response = %{"result" => "Error while opening the file"}

      assert expected_response == response
    end
  end
end
