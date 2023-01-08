module Enumerable
  # Your code goes here

  def my_all?
  #   # How can I pass a block to my_selected
  #   yield # This invoke the block 

  #   self.size == self.my_select(block).size
  # end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self # Self is the array invoking the the method
      yield(element)
    end
    self
  end

  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
  end

  def my_select
    selected = []
    for element in self
      selected << element if yield(element)
    end
    selected
  end


end


