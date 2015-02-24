class Ball
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@x = 200
		@y = 400
		@vx = -5
		@vy = 5
		@w = 20
		@h = 20 
		@image = Gosu::Image.new(window, "app/images/ball.png", false)
	end 

	def move
		@x = @x + @vx
		@y = @y + @vy
		if @x < 0
			@vx = 5
		end
		if @x > 780
			@vx = -5
		end
		if @y < 0
			@vy = 5
		end
		if @y > 580
			@vy = -5
		end
	end 

	def draw
		@image.draw(@x, @y, 1)
	end

	def reverse_y # makes the ball move in reverse
		@vy = -1 * @vy
	end 

end