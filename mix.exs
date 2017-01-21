defmodule PlugUrlRedirector.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :plug_url_redirector,
     version: @version,
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
	 package: package(),
     description: "URL redirector for Plug/Phoenix", 
	 name: "Plug_URL_Redirector",
	 source_url: "https://github.com/jj1bdx/plug_url_redirector",
	 homepage_url: "http://github.com/jj1bdx/plug_url_redirector",
     docs: [extras: ["README.md"], main: "readme",
            source_ref: "v#{@version}",
            source_url: "https://github.com/jj1bdx/plug_url_redirector"],
     dialyzer: [plt_add_deps: :transitive,
                flags: ["-Wunmatched_returns","-Werror_handling","-Wrace_conditions", "-Wno_opaque"]]]
  end

  defp package do
    [licenses: ["MIT"],
     maintainers: ["Kenji Rikitake"],
	 links: %{"GitHub" => "https://github.com/jj1bdx/plug_url_redirector"}]
  end

  def application do
    [applications: []]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:plug, "~> 1.3"},
      {:cowboy, "~> 1.0"},
      {:ex_doc, "~> 0.14", only: :dev},
      {:dialyxir, "~> 0.4", only: [:dev], runtime: false}
    ]
  end
end
