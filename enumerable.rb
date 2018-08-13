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


  def my_none?
    return self.to enum unless block_given?

    if self.class == Hash
      self.my_each do |k,v|
        return false if yield(k,v)
      end
      true

    else
      self.my_each do |i|
        return false if yield(i)
      end
      true
    end
  end


  def my_count
    count = 0

    if self.class == Hash
      if block_given?
        self.my_each do |k,v|
          count += 1 if yield(k,v)
        end
      else
        count = self.length
      end

    else
      if block_given?
        self.my_each do |i|
          count += 1 if yield(i)
        end
      else
        count = self.length
      end
    end

    count
  end

  def my_map
    return self.to enum unless block_given?

    new_array = []
    if self.class == Hash
      self.my_each do |k,v|
        new_array.push yield(k,v)
      end
      return new_array

    else
      self.my_each do |i|
        new_array.push yield(i)
      end
      new_array
    end

  end

  def my_inject(*args)
    total = 0
    if args[0].class == Symbol
      sym = args[0]
      total = self[0]
      self[1..-1].my_each do |i|
        total = total.send(sym, i)
      end

    else
      args.length == 0 ? total = 0 : total = args[0]
      self.my_each do |i|
        total = yield(total,i)
      end
    end
    total

  end

  people = {"John" => 10, "Bob" => 7, "Sam" => 47, "Fred" => 34, "Billy" => 76}
  nums = [3,5,7,3,6,10,20,16]

  puts nums.my_inject(:*)


end
