defmodule Wabanex.UserTest do
	use Wabanex.DataCase, async: true

	alias Wabanex.User

	describe "changeset/1" do
		test "when all params are valid, retuns a valid changeset" do
			params = %{name: "Carlos", email: "carlos@gmail.com", password: "123456"}
			
			response = User.changeset(params)

			assert %Ecto.Changeset{
				valid?: true, 
				changes: %{email: "carlos@gmail.com", name: "Carlos", password: "123456"}, 
				errors: []
				} = response
		end

		test "when there are invalid params, retuns an invalid changeset" do
			params = %{name: "x", email: "carlos@gmail.com"}
			
			response = User.changeset(params)

			expected_response =  %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}

			assert expected_response == errors_on(response)
		end
	end
end