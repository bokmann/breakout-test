class GameWindow < Gosu::Window

	def initialize 
		super 800, 600, false # call the initialize method of your superclass of Gosu::Window 
		self.caption = "BreakOut"
		@ball = Ball.new(self)
		@paddle = Paddle.new(self)
		@bricks = []
		(1..5).each do |rows|
			(1..10).each do |col|
				@bricks.push Brick.new(self, col * 70, rows * 30)
			end
		end
    @score = 0
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end

	def are_touching?(obj1, obj2) # to determine if ball and bricks are touching - generic collision method for two rectangles
		obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h # able to write the .x and .y because of the attr_readers
		# if obj1.x > obj2.x - obj1.w and obj1.x < obj2.x + obj2.w and obj1.y > obj2.y - obj1.h and obj1.y < obj2.y + obj2.h # able to write the .x and .y because of the attr_readers
		# 	return true
		# else
		# 	return false 
		# end 
	end 

	def update
		if button_down?(Gosu::KbLeft) # part of the Gosu gem 
			@paddle.move_left
		end
		if button_down?(Gosu::KbRight)
			@paddle.move_right
		end 
		@ball.move
		if are_touching?(@ball, @paddle)
			@ball.reverse_y
		end
		@bricks.each do |brick|
			if are_touching?(@ball, brick)
        brick.ive_been_hit(self)
				@ball.reverse_y
			end 
		end
    
      exit(0) if @bricks.empty?
	end

  def delete_brick(brick)
    @bricks.delete brick
    @score += 1
  end
  
	def draw
		@ball.draw
		@paddle.draw
		@bricks.each do |brick|
			brick.draw
		end
    @font.draw("Score: #{@score}", 10, 10, 1.1, 1.0, 1.0, 0xffffff00)
	end 

end