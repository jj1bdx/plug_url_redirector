defmodule PlugUrlRedirector.Static do
  import PlugUrlRedirector.Utils

  @moduledoc """
  Static URL redirector.
  """

  def init(opts) do
    Keyword.fetch!(opts, :external)
  end 

  @doc """
  This module Plug redirects the connection regardless of path
  to the given URL in the content of `:external`.
  The redirection return code is 301 (Moved Permanently).
  """
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
