defmodule MPNTBBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :mpntbbot,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {MPNTBBot.Application, []}
    ]
  end

    # Run "mix help deps" to learn about dependencies.
    defp deps do
    [
      {:nostrum, "~> 0.10"},
      {:httpoison, "~> 2.0"},
      {:jason, "~> 1.4"},
      {:html_entities, "~> 0.5"}
    ]
  end

end
