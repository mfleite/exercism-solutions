defmodule Secrets do
  def secret_add(secret) do
    fn n -> secret + n end
  end

  def secret_subtract(secret) do
    fn n -> n - secret end
  end

  def secret_multiply(secret) do
    fn n -> n * secret end
  end

  def secret_divide(secret) do
    # Please implement the secret_divide/1 function
    fn n -> Integer.floor_div(n, secret) end
  end

  def secret_and(secret) do
    # Please implement the secret_and/1 function
    fn n -> Bitwise.band(secret, n) end
  end

  def secret_xor(secret) do
    # Please implement the secret_xor/1 function
    fn n -> Bitwise.bxor(n, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn n -> secret_function2.(secret_function1.(n)) end
  end
end
