defmodule BsIcons do
  {_, 0} = System.shell("./generate.sh")

  @icons File.ls!(Path.join(:code.priv_dir(:bs_icons), "svg"))
         |> Enum.map(&Path.basename(&1, ".svg"))
         |> Enum.sort()

  @types [:svg]

  def all do
    @icons
  end

  def svg_icon(name) do
    name
    |> icon_path(:svg)
    |> File.read!()
  end

  def size(svg, width, height) do
    svg
    |> String.replace("width=\"16\"", "width=\"#{width}\"")
    |> String.replace("height=\"16\"", "height=\"#{height}\"")
  end

  def color(svg, color) do
    String.replace(svg, "currentColor", color)
  end

  def to_png(svg) do
    Resvg.render(svg, :png)
  end

  def icon_path(name, type) when name in @icons and type in @types do
    Path.join(:code.priv_dir(:bs_icons), "#{type}/#{name}.#{type}")
  end
end
