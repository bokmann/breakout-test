class Paddle
	attr_reader :x, :y, :w, :h

	def initialize(window)
		@x = 200
		@y = 550
		@w = 50
		@h = 15
		@image = Gosu::Image.new(window, "app/images/paddle.png", false)
	end

	def move_left
		if @x >0
			@x = @x -7
		end
	end

	def move_right
		if @x < 720
			@x = @x +7
		end
	end 

	def draw 
		@image.draw(@x, @y, 1)
	end

end