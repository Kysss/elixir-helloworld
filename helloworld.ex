## hello world elixir playground

## IO.puts "Hello World!"
## IO.puts ("Hello World2")
## IEx -
## functions - input/output
## modules - aggregate a certain set of functions

defmodule M do

  def main do
    ## name = IO.gets("What's your name?") |> String.trim ##for trimming off the new line
    ## IO.puts("Hey there #{name}")
    data_stuff()
  end

  def data_stuff do
    my_int = 123  ##no maximum integer size
    IO.puts "Integer #{is_integer(my_int)}"

    my_float = 3.14159
    IO.puts "Float #{is_float(my_float)}"

    ## Atom = variable name is exactly the same as the value
    IO.puts "Atom #{is_atom(:newyork)}"
    IO.puts "Atom #{is_atom(:"new york")}"

    ## Strings
    my_str = "My Sentence"
    IO.puts "Length: #{String.length(my_str)}"

    ## concatenate
    longer_str = my_str <> " " <> "is longer"
    IO.puts "Concatenated sentence  #{longer_str}"

    ### equality
    IO.puts "EQUAL: #{"Egg" ==="egg"}" ##false because of capitalized E

    ##Does the string contains? capitalization matters!
    IO.puts "Contains MY? #{String.contains?(my_str, "my")}"

    ##first character of the string
    IO.puts "first: #{String.first(my_str)}"

    ## substring
    IO.puts "Substring: #{String.slice(my_str, 3, 8)}"

    ##9:58
  end


end

