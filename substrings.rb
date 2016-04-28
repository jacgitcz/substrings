def substrings(instring, dictionary)
	if instring.length == 0
		result = {}
	else
		result = Hash.new(0)
		search_string = instring.downcase
		dictionary.each do |word|
			match_list = search_string.scan(word)
			if match_list.length > 0
				result[word] += match_list.length
			end
		end
    end
    result
end