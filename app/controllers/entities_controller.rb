class EntitiesController < ApplicationController
  def index
    puts "User index________#{Entity}"
  end

  def show
    puts 'This show action _______________ for entity'
  end

  def new
    puts 'This is new action ____________ for entity'
  end
end
