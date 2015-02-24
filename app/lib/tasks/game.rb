namespace :game do
  task :play => :environment do
    window = GameWindow.new
    window.show 
  end
end