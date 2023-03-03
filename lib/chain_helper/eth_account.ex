defmodule ChainHelper.EthAccount do
  defstruct [:address, :private_key]

  def rand() do
    {a, p} = Ether.make_key()

    %__MODULE__{
      address: a,
      private_key: p
    }
  end
end
