defmodule ChainHelperCli do
  @moduledoc """
  Daily chain helper.

  Usage:
    $ chainhelper {options} arg1 arg2 ...

  Options:
    --verbose    Show more info.
  """

  alias ChainHelper.EthAccount

  def main([]), do: @moduledoc |> IO.puts()
  def main([opt]) when opt in ["-h", "--help"], do: @moduledoc |> IO.puts()

  def main(args) do
    {opts, cmds, errors} = args |> parse_args

    case errors do
      [] ->
        run_cmd(cmds, opts)

      _ ->
        errors
        |> IO.inspect(label: "Bad options")

        IO.puts(@moduledoc)
    end
  end

  def run_cmd([], _), do: @moduledoc |> IO.puts()

  def run_cmd(["help" | _args], _), do: @moduledoc |> IO.puts()

  def run_cmd(["rand-account" | _args], _) do
    EthAccount.rand()
    |> IO.inspect(label: "rand ether-account")
  end

  defp parse_args(args) do
    args
    |> OptionParser.parse(
      strict: [
        verbose: :boolean,
        count: :integer
      ],
      aliases: [c: :count]
    )

    # {opts, cmd_and_args, errors}
  end
end
