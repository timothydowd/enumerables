module Enumerable

  def my_each
    if self.class == Hash
      for k in self.keys do
        yield(k,self[k])
      end
    else
      for i in 0..self.length-1 do
        yield(self[i])
      end
    end
  end

  def my_each_with_index
    if self.class == Hash
      for k in self.keys do
        yield(k,self[k])
      end
    else
      for i in 0..self.length-1 do
        yield(self[i])
      end
    end
  end













  people = {"John" => 10, "Bob" => 7, "Sam" => 47, "Fred" => 34}
  nums = [3,5,7,3,6]



end
