def sluggish_octo(fishes)
    fishes.each.with_index do |fish1, i|
        max_length = true

        fishes.each.with_index do |fish2, j|
            next if j == i
            max_length = false if fish2.length > fish1.length
        end

        return fish1 if max_length
    end
end
    def dominant_octo(fishes)
        return fishes if fishes.length <= 1

        mid = fishes.length / 2
        left, right = fishes.take(mid), fishes.drop(mid)
        left_sorted, right_sorted = dominant_octo(left), dominant_octo(right)

        merge(left_sorted, right_sorted)
    end

    def merge(left, right)
        merged_arr = []

        until left.empty? || right.empty?
            if left.first < right.first
                merged_arr << left.shift
            else
                merged_arr << right.shift
            end
        end

        merged_arr + left + right
    end

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
#  'fiiiissshhhhhh']
# => "fiiiissshhhhhh"