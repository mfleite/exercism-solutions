defmodule LogLevel do
  def to_label(level, legacy) do
    cond do
      # Levels supported by all systems
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      # Stop here if legacy
      legacy -> :unknown
      # Only supported by new systems
      level == 0 -> :trace
      level == 5 -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy) do

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
