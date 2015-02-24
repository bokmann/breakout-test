class Brick
	attr_reader :x, :y, :w, :h

	def initialize(window, x, y)
		@x = x
		@y = y
		@w = 50
		@h = 22
		@image = Gosu::Image.new(window, "app/images/brick.png", false)
	end

	def draw
		@image.draw(@x, @y, 1)
	end 

end 