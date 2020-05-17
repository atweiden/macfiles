IEx.configure(
  colors: [eval_result: [:cyan, :bright]],
  default_prompt:
    [
      "\e[G",
      [:blue],
      "%prefix(%counter)",
      ">",
      :reset
    ]
    |> IO.ANSI.format()
    |> IO.chardata_to_string()
)

defmodule R do
  def reload! do
    Mix.Task.reenable("compile.elixir")
    Application.stop(Mix.Project.config()[:app])
    Mix.Task.run("compile.elixir")
    Application.start(Mix.Project.config()[:app], :permanent)
  end
end
