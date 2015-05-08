module LettersHelper

  def mark_letter_read
    @letters.each do |l,c|
      next if(l.ltype != "letter" || l.player_id == @player.id)
      l.read = true
      l.save
    end
  end

end
