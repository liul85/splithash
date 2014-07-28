class SplitHash
  def initialize
    @arr = []
  end

  def splithash(hashes, *args)
    #set the array index
    array_key = 0

    #check split keys if not existed in hash keys
    args.each do |a|
      raise 'Seperate key not found in hashes' if hashes.keys.index(a).nil?
    end

    hashes.each do |k, v|
      if args.include? k
        @arr.push({ k => v })
        array_key += 1
      else
        if array_key == 0
          @arr.push({ k => v })
          array_key += 1
        else
          @arr[array_key-1].merge!({ k => v })
        end
      end
    end
    @arr
  end
end
