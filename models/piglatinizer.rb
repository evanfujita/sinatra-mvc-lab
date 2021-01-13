class PigLatinizer

    attr_accessor :words

    def translate
        
        parsed_phrase = self.words.split
        @piglatin_phrase = latin_phrase(parsed_phrase).join(" ")
    end

    def latin_phrase(parsed_phrase)
        phrase = []
        parsed_phrase.map do |word|
            phrase << piglatinize(word)
        end
        phrase
    end

    def piglatinize(word)
        vowel = ["a", "e", "i", "o", "u"]
        ending = "ay"
            prefix = []
            suffix = []
            letter_count = word.length
            count = 0
            down_word = word.downcase
            while !vowel.any?(down_word[count]) do
                prefix << down_word[count]
                count += 1
            end
            until count == letter_count do
                suffix << down_word[count]
                count += 1
            end
            if prefix.count == 0
                ending = "way"
            end
            prefix << ending
            pig_array = suffix << prefix 
            pig_word = pig_array.join
            if word[0] == word[0].upcase
                pig_word.capitalize!
            end
                pig_word
    end

end


