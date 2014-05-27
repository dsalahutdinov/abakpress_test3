require 'spec_helper'
 
describe Tree do
  it "tree construction" do
    tree = Tree.new(lambda {|x| x })
    [5, 1, 7].each {|n| tree.insert(n)  }
    tree.root_node.value.should == 5
    tree.root_node.field_reader.should_not == nil

        
    tree.root_node.left.value == 1
    tree.root_node.right.value == 7
  end
  
  
  it "search node with the same value" do
    tree = Tree.new(lambda {|x| x })
    [1, 2, 3, 4, 5, 6, 7, 8].each {|n| tree.insert(n)  }
    tree.search(5).collect(&:value).should == [5]
    tree.search(9).collect(&:value).should == []
  end
  
  it "search nodes with less value v1" do
    tree = Tree.new(lambda {|x| x })
    [5, 1, 2, 3, 4, 6, 7, 8].each {|n| tree.insert(n)  }
    
    result = tree.search_less(5)
    result.collect(&:value).should == [1, 2, 3, 4]
  end
  
  it "search nodes with less value v2" do
    tree = Tree.new(lambda {|x| x })
    [5, 2, 3, 1, 4, 7, 8].each {|n| tree.insert(n)  }
    result = tree.search_less(6)
    result.collect(&:value).should == [1, 2, 3, 4, 5]
    
  end
  
  it "random tree genrator test" do
    l = 20
    100.times do |t|
    tree = Tree.new(lambda {|x| x })
      data = (0..(l-1)).to_a.sort_by{|| (rand *  100).round }
      data.each {|n| tree.insert(n)  }
      target = (rand * 1000).round % l + 1
      
      result = tree.search_less(target)
      result.collect(&:value).should == (0..(target-1)).to_a
      
      result = tree.search_greater(target)
      result.collect(&:value).should == ((target+1)..(l-1)).to_a.reverse
    end
  end
  
  it "check traversers" do
    tree = Tree.new(lambda {|x| x })
    data = [1,2,3,4,5,6,7,8,9,10]
    data.each {|n| tree.insert(n) }
    LeftRightTraverser.new(tree.root_node).collect(&:value).should == data
    RightLeftTraverser.new(tree.root_node).collect(&:value).should == data.reverse
    OneNodeTraverser.new(tree.root_node).collect(&:value).should == [1]
    EmptyNodeTraverser.new().collect(&:value).should == []
  end
end