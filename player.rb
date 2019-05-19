require 'gosu'

class Player
		
	HEIGHT = 80
	WIDTH = 10

	attr_reader :x
  attr_reader :y
  attr_reader :score
  attr_reader :name

  def initialize(window, x, y, name)
    @window = window
    @init_x = x
    @init_y = y
		@x = x
    @y = y
    @name = name
		@score = 0
  end

	def move_up
		@y -= 5
		@y = [HEIGHT/2, @y].max
	end

	def move_down
		@y += 5
		@y = [400 - HEIGHT/2, @y].min
	end

	def hit_ball(ball)
		(@x - ball.x).abs < 5 && (@y - ball.y).abs < 50
	end

  def reset
    @x = @init_x
    @y = @init_y
  end

  def _score
    @score += 1
  end

	def draw
		@window.draw_quad(
			@x - WIDTH/2, @y - HEIGHT/2, Color::WHITE,
     	@x + WIDTH/2, @y - HEIGHT/2, Color::WHITE,
      @x + WIDTH/2, @y + HEIGHT/2, Color::WHITE,
			@x - WIDTH/2, @y + HEIGHT/2, Color::WHITE
		)
	end
 
end
