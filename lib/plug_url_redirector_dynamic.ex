defmodule PlugUrlRedirector.Dynamic do
  import PlugUrlRedirector.Utils

  @moduledoc """
  Dynamic URL redirector.
  """

  def init(opts) do
    Keyword.fetch!(opts, :external)
  end 

  @doc """
  This module Plug redirects the given path at `conn.request_path`
  to the given content of `:external` *prepended*.
  The redirection return code is 301 (Moved Permanently).

  Example: for `conn.request_path` of `/test/test2.html',
  if `:external` is set to `http://test.example.com`,
  the request is redirected to `http://test.example.com/test/test2.html`.
  """
  def call(conn, external) do
    do_redirect(conn, external <> conn.request_path)
  end

  defp do_redirect(conn, nil), do: conn

  defp do_redirect(conn, newpath) do
    conn
      |> Plug.Conn.put_status(301)
      |> redirect(external: newpath)
      |> Plug.Conn.halt
  end
end
