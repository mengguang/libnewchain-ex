defmodule Mix.Tasks.Compile.NewChain do
  def run(_) do
    {_, exit_code} = System.cmd("make", [], into: IO.stream(:stdio, :line))

    case exit_code do
      0 -> :ok
      _ -> :error
    end
  end
end

defmodule LibNewChain.Mixfile do
  use Mix.Project

  def project do
    [
      app: :libnewchain,
      version: "0.1.11",
      language: :erlang,
      description: "Erlang NIF bindings for the the libnewchain library",
      package: [
        maintainers: ["Meng Guang"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/mengguang/libnewchain"}
      ],
      compilers: [:new_chain, :elixir, :app],
      deps: deps()
    ]
  end

  defp deps() do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
