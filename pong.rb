require 'gosu'
include Gosu
require_relative 'ball.rb'
require_relative 'player.rb'
require_relative 'score_table.rb'

class Pong < Gosu::Window

    HEIGHT = 400
    WIDTH = 800
  
  def initialize
    super(WIDTH, HEIGHT)
    #self.caption = "Pong"
    @ball = Ball.new(self, WIDTH, HEIGHT)
    @player1 = Player.new(self, 40, HEIGHT/2, 'player1')
    @player2 = Player.new(self, WIDTH - 40, HEIGHT/2, 'player2')
    @players = [@player1, @player2]
    @winner = nil
    @score_table = Score_table.new(self, WIDTH)
    @background_image = Gosu::Image.new("./bg.jpg", :tileable => true)
    @state = :stopped
  end

  def update
    if @state == :in_play
      if button_down?(KbW)
        @player1.move_up
      end
      if button_down?(KbS)
        @player1.move_down
      end
      if button_down?(KbDown)
        @player2.move_down
      end
      if button_down?(KbUp)
        @player2.move_up
      end
      if @player1.hit_ball(@ball)
        @ball.hit_paddle(@player1.y - @ball.y)
      end
      if @player2.hit_ball(@ball)
        @ball.hit_paddle(@player2.y - @ball.y)
      end
      if @ball.x < 0
        @player2._score
        @players.each(&:reset)
        @ball.reset
        @state = :stopped
      end
      if @ball.x > WIDTH
        @player1._score
        @players.each(&:reset)
        @ball.reset
        @state = :stopped
      end
      if @player1.score == 10
        @winner = @player1
        @state = :ended
      elsif @player2.score == 10
        @winner = @player2
        @state = :ended
      end
      @ball.update
    elsif @state == :stopped
      if button_down?(KbSpace)
        @state = :in_play
      end
    end
  end

  def draw
    @background_image.draw(0,0,0)
    if @state == :ended
      @score_table.draw_win(@winner)
    end
    @score_table.draw(@players)
    @player1.draw
    @player2.draw
    @ball.draw
  end
end

Pong.new.show



