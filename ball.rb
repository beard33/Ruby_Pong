require 'gosu' 

class Ball

	attr_accessor :x, :y

  def initialize(window, x, y)
		@window = window
		@init_y = y/2
    @init_x = x/2
    reset
    @vy = 0
    @vx = 5
		#puts @height
	end
	
	def update
    @x += @vx
    @y += @vy
    if @y > 400 || @y < 0
      @vy *= -1
    end
	end

	def draw
		@window.draw_quad(
			@x-5, @y-5, Color::WHITE,
			@x-5, @y+5, Color::WHITE,
			@x+5, @y-5, Color::WHITE,
			@x+5, @y+5, Color::WHITE
		)	
  end
  
  def hit_paddle(hit_point)
    @vx *= -1
    @vy += hit_point / 10
  end

  def reset
    @x = @init_x
    @y = @init_y
    @vx = 5
    @vy = 0
  end


end


