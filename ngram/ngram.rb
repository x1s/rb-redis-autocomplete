SIZE = 3
def ngram word 
  word = normalize_word word
  data= []
  (0..(word.length)).each{ |l|
    prefix = word[l,SIZE]
    if prefix.length == SIZE
      data.push prefix
    end
  }
  data
end

def normalize_word word
  case word.length
  when 2
    "##{word}"
  else
    "##{word}#"
  end
end