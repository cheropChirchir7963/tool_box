defmodule ToolBoxWeb.PageController do
  use ToolBoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def home(conn, _params) do
    render(conn, "home.html")
  end

  def hello(conn, %{"name" => name}) do
    render(conn, "hello.html", name: name)
  end

  def dunia(conn, %{"jina" => jina}) do
    render(conn, "habari.html", jina: jina)
  end
end
