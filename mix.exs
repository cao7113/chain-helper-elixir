defmodule ChainHelper.MixProject do
  use Mix.Project

  def project do
    [
      app: :chain_helper,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # https://hexdocs.pm/mix/Mix.Tasks.Escript.Build.html
      escript: [
        app: nil,
        name: :chainhelper,
        main_module: ChainHelperCli,
        comment: "chain-helper cli"
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ChainHelper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:req, "~> 0.3"},
      {:abx, github: "cao7113/abx", tag: "v0.0.10"}
      # {:abx, path: "local-fortube/abx"},
    ]
  end
end
