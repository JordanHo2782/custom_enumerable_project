module Enumerable
  # Your code goes here

  def my_all?(&block)
    self.size == self.my_select(&block).size
  end

  def my_any?(&block)
    # How can I pass a block to my_selected
    self.my_select(&block).size.positive?
  end

  def my_none?(&block)
    self.my_select(&block).size <= 0
  end

  def my_count(&block)
    return self.size unless block_given?
    self.my_select(&block).size
  end

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

  def my_map
    mapped_arr = []
    for element in self
      mapped_arr << yield(element)
    end
    mapped_arr 
  end

  def my_inject(init)
    for element in self
      init = yield(init, element)
    end
    init
  end

end


