class Brick
	attr_reader :x, :y, :w, :h

	def initialize(window, x, y, point_value = 10)
		@x = x
		@y = y
		@w = 50
		@h = 22
		@image = Gosu::Image.new(window, "app/images/brick.png", false)
    @point_value = point_value
	end

	def draw
		@image.draw(@x, @y, 1)
	end 

  def ive_been_hit(window)
    window.delete_brick(self)
    window.update_score(@point_value)
  end
  
end 