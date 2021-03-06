## hello world elixir playground

## IO.puts "Hello World!"
## IO.puts ("Hello World2")
## IEx -
## functions - input/output
## modules - aggregate a certain set of functions

defmodule M do

  def main do
     ##name = IO.gets("What's your name?") |> String.trim 
     ##the pipe is for trimming off the new line
     ##IO.puts("Hey there #{name}")
    data_stuff()
    do_math_stuff()
    compare_stuff()
    check_tuple()
    list_stuff()
    map_stuff()
    pattern_matching_stuff()
    anoynomous_function_stuff()
    recursion_stuff()
    enumerator()
    exception_handle()
    concurrency()
    
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

    ## prints the internal representation of a value
    IO.inspect String.split(longer_str, " ")

    IO.puts String.reverse(longer_str)
    IO.puts String.upcase(longer_str)
    IO.puts String.downcase(longer_str)
    IO.puts String.capitalize(longer_str)

    ## pipe into another function
    4 * 10 |> IO.puts

  end


  ## Math operations
  def do_math_stuff do

    IO.puts "5 + 4 = #{5+4}"
    IO.puts "5 - 4 = #{5-4}"
    IO.puts "5 * 4 = #{5*4}"
    IO.puts "5 / 4 = #{5/4}"
    IO.puts "5 dev 4 = #{div(5,4)}"
    IO.puts "5 rem 4 = #{div(5,4)}"

  end

  def compare_stuff do
    ##compare values
    IO.puts "4 == 4.0 : #{4 == 4.0} "
    ##compare data types : integer vs. float
    IO.puts "4 === 4.0 : #{4 === 4.0} "
    ## compare values
    IO.puts "4 != 4.0 : #{4 != 4.0} "
    ## compare data types as well as values
    IO.puts "4 !== 4.0 : #{4 !== 4.0} "

    IO.puts "5 !== 4 : #{5 > 4 } "

    ## operators & if-else
    age = 18
    IO.puts "Vote and drive: #{(age >= 16) and (age >=18)}"
    IO.puts "Vote and drive: #{(age >= 16) or (age >=18)}"
    IO.puts not true

    if age >= 18 do
      IO.puts "You Can Vote"
    else
      IO.puts "can't vote"
    end

    unless age === 18 do
      IO.puts "You are not 18"
    else
      IO.puts "You are 18"
    end

    ## similar to if-elseif-elseif-else
    cond do
      age >= 18 -> IO.puts "Can vote"
      age >= 16 -> IO.puts "You can drive"
      age >= 14 -> IO.puts "You can wait"
      true -> IO.puts "Default"
    end
  end


  ## tuple : index 0 based
  def check_tuple do

    my_stats = {175,6.25, :yingying}
    IO.puts "Tuple #{is_tuple(my_stats)}"
    my_stats2 = Tuple.append(my_stats, 41)
    IO.puts "Age #{elem(my_stats2, 3)}"
    IO.puts "Size: #{tuple_size(my_stats2)}"

    my_stats3 = Tuple.delete_at(my_stats2, 0)
    ## Note, a new storage area is required to be created
    my_stats4 = Tuple.insert_at(my_stats3, 0, 2020)

    ## duplicating zeros 5 times
    many_zeros = Tuple.duplicate(0,5)

    {weight, height, name} = { 175, 6.25, "YY"}
    IO.puts "Weight : #{weight}"
    
  end


  def list_stuff do
    list1 =[1,2,3]
    list2 =[4,5,6]
    ## combine 2 lists
    list3 = list1++list2

    ## subtract a list from a list
    list4 = list3--list1

    ## this checks whether an element is inside of a list
    IO.puts 6 in list4

    ## extract out the first element and the rest of the element
    [head|tail] = list3
    IO.puts "Head : #{head}"

    ## alternative way of puts, except that this doesn't output a new line
    IO.write "Tail : "
    ##IO.inspect tail

    ## this will print out 'ab''
    IO.inspect [97,98]

    ## ?????
    IO.inspect [97,98], charlists: :aslists

    ## iterate through each item
    Enum.each tail, fn item ->
      IO.puts item
    end

    words = ["Random","Words","in a ", "list"]
    Enum.each words, fn word ->
      IO.puts word
    end

     #display_list(words)
    # delete element
    #  IO.puts display_list(List.delete(words, "Random"))
    #  # delete by index
    #  IO.puts display_list(List.delete_at(words, 1))

    #  IO.puts display_list(List.insert_at(words, 4, "yeah"))
    #  IO.puts List.first(words)
    #  IO.puts List.last(words)

     my_stats = [name: "YY", height: 2.2]
  
  end

  ## prolog
  # def display_list ([word|words]) do
  #     IO.puts word
  #     display_list(words)
  # end

  ## base case : do nothing
  ##def display_list([]), do: nil


  def map_stuff do

    capitals = %{"Alabama" => "Montgomery",
    "Alaska" => "Juneau", "Arizona" => "Phoenix"}

    IO.puts "Captaial of Alaska is #{capitals["Alaska"]}"

    ## or, use atoms as keys
    capitals2 = %{ alabama: "Montgomery",
    alaska: "Juneau", arizona: "Phoenix"}

    IO.puts "Captaial of Arizona is #{capitals2.arizona}"
    
    capitals3 = Dict.put_new(capitals, "Arkansas", "Little Rock")
  
  end

  def pattern_matching_stuff do
    ###39:38
    [length, width] = [20,30]
    IO.puts "Width : #{width}"
  end
  
  def anoynomous_function_stuff do
    get_sum = fn(x,y) -> x + y end
    IO.puts "5 + 5 = #{get_sum.(5,5)}"

    get_less = &(&1 - &2) ##subtract values
    IO.puts "7 - 6 = #{get_less.(7,6)}"

    add_sum = fn
      {x,y} -> IO.puts "#{x} + #{y} = #{x+y}"
      {x,y,z} -> IO.puts "#{x} + #{y} + #{z}= #{x+y+z}"
    end

    add_sum.({2,99})
    add_sum.({2,99,1})

    IO.puts do_it()


  end 

  def do_it(x \\ 1, y \\ 1) do
    x + y
  end

  ## calls factorial
  def recursion_stuff do

    IO.puts "Factorial of 4 : #{factorial(4)}"
    IO.puts "Sum : #{sum([1,2,3,4])}"

    loop(5,1)
    
  end

  ##factorial function 
  def factorial(num) do
    if num <= 1 do
      1
    else
      result = num * factorial(num-1)
      result
    end
  end

  def loop(0,_), do: nil
  def loop(max, min) do
    if max < min do
      loop(0, min)
    else
      IO.puts "Num : #{max}"
      loop(max-1, min)
    end
  end

  def sum([]), do: 0
 
  ## if(some_condition?, do: :this, else: :that)
  def sum([h|t]), do: h + sum(t)
  
  def enumerator do
    IO.puts "Even list: #{Enum.all?([1,2,3],
    fn(n) -> rem(n,2)==0 end)}"

    IO.puts "Even list: #{Enum.any?([1,2,3],
    fn(n) -> rem(n,2)==0 end)}"

    dbl_list = Enum.map([1,2,3], fn(n)-> n * 2 end)

    sum_vals = Enum.reduce([1,2,9], fn(n,sum)-> n + sum end)

    IO.inspect Enum.uniq([1,2,2])

    dbl_list_values = for n <- [1,2,3], do: n*2
    IO.inspect dbl_list_values
    even_list = for n <- [1,2,3,4], rem(n,2)==0, do: n
    IO.inspect even_list
  end

  ## exception handling
  def exception_handle do
    err = try do
      5 / 0
    rescue 
      ArithmeticError -> "Can't divide by zero"
    end
    IO.puts err
  end

  ## concurrency! multiple blocks of code all at the once
  def concurrency do
    spawn(fn() -> loop(50,1) end)
    spawn(fn() -> loop(100,1) end)

    send(self(),{:french, "BOB"})
    receive do
      {:german, name} -> IO.puts "Guten tag #{name}"
      {:french, name} -> IO.puts "Bonjour #{name}"
      {:chinese, name} -> IO.puts "Ni hao #{name}"
      {:english, name} -> IO.puts "hello #{name}"


      ##timeout if no response ??
    after
      500 -> IO.puts "TIMES UP"
    end

    
  end
end



