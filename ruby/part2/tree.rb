class Tree
  attr_accessor :children, :node_name, :indent

  def initialize(name, children=[], indent=0)
    if children.class == Hash
      children = children.map {|key, val|
        Tree.new(key, val, indent+1)
      }
    elsif children.class == Array
      children = children.map{|item|
        Tree.new(children.index(item), item, indent+1)
      }
    end
        
    @children = children
    @node_name = name
    @indent = indent
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

src1 =
  {'grandpa' =>
    {'dad'   => {'child1' => [{'grand child1' => []}], 'child2' => []},
     'uncle' => {'child3'=> [], 'child4'=>[]}}
}
tree1 = Tree.new('root', src1)
tree1.visit_all {|node|
  puts ' ' * node.indent + node.node_name.to_s
}
