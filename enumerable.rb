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
    return self.to enum unless block_given?

    if self.class == Hash
      items = Hash.new
      self.my_each do |k,v|#for each key and value of object
        items[k] = v if yield(k,v) # create key and val if block is true
      end
      items

    else
      items = []
      self.my_each do |i| #for each item in self object
        items.push(i) if yield(i) #add i to items array if block is true
      end
      items
    end

  end

  def my_all?
    return self.to enum unless block_given?
    if self.class == Hash
      items = Hash.new
      self.my_each do |k,v|#for each key and value of object
        items[k] = v if yield(k,v) # create key and val if block is true
      end
      items == self ? true : false

    else
      items = []
      self.my_each do |i| #for each item in self object
        items.push(i) if yield(i) #add i to items array if block is true
      end
      items == self ? true : false
    end

  end

  def my_any?
    return self.to enum unless block_given?
    if self.class == Hash
      self.my_each do |k,v|
        return true if yield(k,v)
      end
      false


    else
      self.my_each do |i|
        return true if yield(i)
      end
      false
    end
  end

  people = {"John" => 10, "Bob" => 7, "Sam" => 47, "Fred" => 34}
  nums = [3,5,7,3,6,10,20,16]

  puts people.my_any?{|x,y|y==10}



end
