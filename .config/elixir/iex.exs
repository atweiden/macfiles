defmodule ANSI do
  @ansi_colors [:black, :red, :green, :yellow, :blue, :magenta, :cyan]
  def pick_ansi_color() do
    Enum.random(@ansi_colors)
  end
end

IEx.configure(
  colors: [eval_result: [:cyan, :bright]],
  default_prompt:
    [
      "\e[G",
      [ANSI.pick_ansi_color()],
      "%prefix(%counter)",
      ">",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string(),
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80
  ],
  width: 80
)

defmodule R do
  def reload! do
    Mix.Task.reenable("compile.elixir")
    Application.stop(Mix.Project.config()[:app])
    Mix.Task.run("compile.elixir")
    Application.start(Mix.Project.config()[:app], :permanent)
  end
end
