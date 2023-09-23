defmodule NPrimes do
  def get_primes(n) when n < 2, do: []
  def get_primes(n), do: Enum.filter(2..n, &is_prime?(&1))

  defp is_prime?(2), do: true
  defp is_prime?(3), do: true
  defp is_prime?(x) when is_integer(x) and x > 3, do: is_prime?(x, 2)

  defp is_prime?(x, divisor) when divisor * divisor > x, do: true
  defp is_prime?(x, divisor) when rem(x, divisor) == 0, do: false
  defp is_prime?(x, divisor) do
    is_prime?(x, divisor + 1)
  end
end
