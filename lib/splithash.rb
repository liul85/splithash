class SplitHash
  def initialize
    @arr = []
  end

  def splithash(*args)
    hashs = args[0]
    array_key = 0
    args.delete_at(0)
    hashs.each do |k, v|
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
