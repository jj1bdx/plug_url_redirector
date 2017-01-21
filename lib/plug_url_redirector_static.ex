defmodule PlugUrlRedirector.Static do
  import PlugUrlRedirector.Utils

  def init(opts) do
    Keyword.fetch!(opts, :external)
  end 

  def call(conn, external) do
    do_redirect(conn, external)
  end

  defp do_redirect(conn, nil), do: conn

  defp do_redirect(conn, newpath) do
    conn
      |> Plug.Conn.put_status(301)
      |> redirect(external: newpath)
      |> Plug.Conn.halt
  end
end
