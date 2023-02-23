defmodule BsIcons do
  @icons File.ls!(Path.join(:code.priv_dir(:bs_icons), "png"))
         |> Enum.map(&Path.basename(&1, ".png"))
         |> Enum.sort()

  def all do
    @icons
  end

  def icon_path(name) when name in @icons do
    Path.join(:code.priv_dir(:bs_icons), "#{name}.png")
  end
end
