defmodule TakeANumber do
  def start() do
    new_process_identifier = spawn(fn -> receive_loop(0) end)

    IO.inspect(new_process_identifier, label: "new_process_identifier")
  end

  defp receive_loop(state) do
    receive do
      {:report_state, sender_pid} ->
        IO.inspect(sender_pid, label: "sender_pid")

        send(sender_pid, state)
        receive_loop(state)

      {:take_a_number, sender_pid} ->
        next_state = state + 1

        send(sender_pid, next_state)
        receive_loop(next_state)

      :stop ->
        :bye_bye

      _ ->
        receive_loop(state)
    end
  end
end
