defmodule NameBadge do
  def print(id, name, department) do
    # Please implement the print/3 function

    "#{if id, do: "[#{id}] - ", else: ""}#{name} - #{if(department, do: String.upcase(department), else: "OWNER")}"
  end
end
