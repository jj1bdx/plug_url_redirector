defmodule ExampleRedirector.Endpoint do
  use Plug.Builder

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.MethodOverride
  plug Plug.Head

  plug PlugUrlRedirector.Static,
       external: "http://example.com"

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http ExampleRedirector.Endpoint, []
  end


end
