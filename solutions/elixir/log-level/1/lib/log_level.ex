defmodule LogLevel do
  def to_label(level, legacy) do
    # Please implement the to_label/2 function
    cond do
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      legacy -> :unknown
      level == 0 -> :trace
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy) do
    # Please implement the alert_recipient/2 function

    label = LogLevel.to_label(level, legacy)
    
    cond do
      label == :error -> :ops
      label == :fatal -> :ops
      label != :unknown -> false
      legacy -> :dev1
      true -> :dev2
    end
  end
end
