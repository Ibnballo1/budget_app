class UsersController < ApplicationController
  def index
    puts "User index________#{User}"
  end

  def show
    puts 'This show action _______________'
  end

  def new
    puts 'This is new action ____________'
  end
end
