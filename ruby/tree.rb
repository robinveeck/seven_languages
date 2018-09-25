class Tree
	attr_accessor :children, :node_name

	def initialize(tree_hash)
		@node_name = tree_hash.keys[0]
		@children = []
		tree_hash[@node_name].each do |key, value|
			@children << Tree.new({key => value})
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new({'grandpa' => {'dad' => {'child1' => {}, 'child2' => {}}, 'uncle' => {'child 3' => {}, 'child 4' => {} }}})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
