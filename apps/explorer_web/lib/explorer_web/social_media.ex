defmodule ExplorerWeb.SocialMedia do
  @moduledoc """
  This module provides social media links
  """

  @services %{
    facebook: "https://www.facebook.com/",
    instagram: "https://www.instagram.com/",
    twitter: "https://www.twitter.com/",
    telegram: "https://t.me/"
  }

  def links do
    :explorer_web
    |> Application.get_env(__MODULE__, [])
    |> Enum.reverse()
    |> filter_and_build_links()
  end

  # Private functions

  defp filter_and_build_links(configured_services) do
    for {name, account} <- configured_services, Map.has_key?(@services, name) do
      {name, @services[name] <> account}
    end
  end
end