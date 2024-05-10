defmodule EntitySports.MixProject do
  use Mix.Project

  def project do
    [
      app: :entity_sports,
      version: "1.0.32",
      elixir: "~> 1.14",
      elixirc_options: [warnings_as_errors: warnings_as_errors?(Mix.env())],
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      deps: deps(),
      aliases: aliases(),
      name: "EntitySports",
      docs: docs(),
      dialyzer_ignored_warnings: []
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: [],
      extra_applications: [:logger, :jose]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:credo, "~> 1.2", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.12", only: :test},
      {:jason, "~> 1.2"},
      {:ecto, "~> 3.6"},
      {:httpoison, "~> 1.7"},
      {:poison, "~> 4.0"},
      {:jose, "~> 1.11"}
    ] ++ deps(Mix.target(), Mix.env())
  end

  defp deps(:elixir_ls, :test), do: []
  defp deps(_, _), do: [{:dialyzex, "~> 1.3", only: [:dev, :test], runtime: false}]

  defp aliases do
    [
      "check.all": [
        "format --check-formatted --dry-run",
        "credo",
        "coveralls.html",
        "dialyzer"
      ]
    ]
  end

  defp docs do
    [
      main: "EntitySports",
      source_ref: "develop",
      extras: ["README.md"]
    ]
  end

  defp warnings_as_errors?(env) when env in [:dev, :test],
    do: System.get_env("FORCE_WARNINGS_AS_ERRORS") == "true"

  defp warnings_as_errors?(_), do: true
end
