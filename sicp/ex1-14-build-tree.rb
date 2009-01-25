require 'rubygems'
require 'rgl/adjacency'
require 'rgl/dot'


class Change
  @@dg = RGL::DirectedAdjacencyGraph[]
  @@id = 0
  COINS = [0, 1, 5, 10, 25, 50]
  
  def initialize(amount, coins = 5)
    @id = @@id += 1
    @amount = amount
    @coins = coins
  end
  
  def possibilities
    case
    when win?
      1
    when fail?
      0
    else
      first = Change.new(@amount, @coins - 1)
      second = Change.new(@amount - COINS[@coins], @coins)
      @@dg.add_edge(self, first)
      @@dg.add_edge(self, second)
      first.possibilities +
      second.possibilities
    end
  end
  
  def win?
    @amount == 0
  end
  
  def fail?
    @amount < 0 || @coins == 0
  end
  
  def to_s
    base = "#{@id}: $#{@amount}, #{@coins} coins"
    base += " = WIN!" if win?
    base
  end
  
  def graph
    @@dg
  end
end
    

c = Change.new(11)
puts c.possibilities

unless ARGV[0] == "--no-graph"
  File.open("graph.dot", "w"){|f|f << c.graph.to_dot_graph('fontsize' => 14)}
  system("dot -Tpng graph.dot -o graph.png")
end
