n = String.trim(IO.read(:stdio, :line)) |> String.to_integer()
Enum.each(2..(n-1), fn i ->
  prime = true
  Enum.each(2..(i-1), fn b ->
    if rem(i, b) == 0 do
      prime = false
      :break
    end
  end)
  IO.puts(i) if prime
end)
