defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, retuns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response = {:ok, %{"Buscapé" => 25.95155709342561, "Nego Drama" => 27.68166089965398, "Zé galinha" => 17.77777777777778, "Zé pequeno" => 23.437499999999996}}

      assert response == expected_response
    end

    test "when the file does not exists, retuns an error" do
      params = %{"filename" => "wrong.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
