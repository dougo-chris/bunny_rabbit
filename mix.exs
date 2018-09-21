defmodule Linklab.Bunny.Mixfile do
  use Mix.Project

  @version "0.1.0"
  @elixir_version "~> 1.7"

  def project do
    [
      app: :linklab_bunny,
      version: @version,
      elixir: @elixir_version,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),

      description: description(),
      package: package(),

      aliases: aliases(),
      dialyzer: dialyzer()
    ]
  end

  # def application do
  #   [
  #     extra_applications: [:logger]
  #   ]
  # end

  defp elixirc_paths(:test), do: ["lib", "priv", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:ranch_proxy_protocol, "~> 2.0", override: true},
      {:amqp, "~> 1.0"},
      {:poolboy, "~> 1.5.1"},

      # DEV AND TEST
      {:dialyxir, "~> 0.5", only: :dev, runtime: false},
      {:mix_test_watch, "~> 0.9", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    RabbitMQ channel pools
    """
  end

  defp package do
    [
      maintainers: ["Chris Douglas"],
      licenses: ["TODO"],
      links: %{"Github" => "TODO"},
      files: ~w(lib mix.exs README.md)
    ]
  end

  defp aliases do
    [
    ]
  end

  defp dialyzer do
    [
      plt_add_deps: :transitive,
      plt_add_apps: [:mix]
    ]
  end
end
