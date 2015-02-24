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
				@ball.reverse_y
				@bricks.delete brick 
			end 
		end
	end

	def draw
		@ball.draw
		@paddle.draw
		@bricks.each do |brick|
			brick.draw
		end 
	end 

end