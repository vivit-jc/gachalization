module LettersHelper

  def responded?(letter)
    letter.read && letter.ltype != "letter"
  end

  def mark_letter_read
    @letters.each do |l,c|
      next if(l.ltype != "letter")
      l.read = true
      l.save
    end
  end
end
