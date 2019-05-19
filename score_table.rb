require 'gosu'

class Score_table

  def initialize(window, width)
    @window = window
    @width = width - 125
    @width2 = width - 200
    @font = Font.new(window, 'Arial',60)
    @font2 = Font.new(window, 'Arial', 40)
  end

  def draw(players)
    @font.draw_text("#{players.map(&:score).join('  -  ')}", @width/2, 20, 0)
  end

  def draw_win(player)
    @font2.draw_text("#{player.name} WON!!", @width2/2, 300, 0)
  end

end
