module Enumerable

  def my_each
    return self.to enum unless block_given?
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
    return self.to enum unless block_given?

    if self.class == Hash
      i = 0
      for k in self.keys do
        yield(k,self[k],i)
        i += 1
      end
    else
      for i in 0..self.length-1 do
        yield(i,self[i])
      end
    end
  end

  def my_select
    self.my_each {|x| yield(self)}

  end



  people = {"John" => 10, "Bob" => 7, "Sam" => 47, "Fred" => 34}
  nums = [3,5,7,3,6,10,20,16]

  puts nums.my_select{|x| x%2==0}



end
