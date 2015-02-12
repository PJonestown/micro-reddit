require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
  	@user = User.new(username: 'Paul', password: 'foobar')
  end

  test "should be valid" do 
  	assert @user.valid?
  end 

  test "should be present" do 
  	@user.username = ''
  	assert_not @user.valid?
  end

  test "username should not be over 25 characters" do 
  	@user.username = 's' * 26
  	assert_not @user.valid?
  end

  test "username should be unique" do 
  	duplicate_user = @user.dup 
  	duplicate_user.username = @user.username.upcase
  	@user.save 
  	assert_not duplicate_user.valid?
  end

  test "password should be present" do 
  	@user.password = ''
  	assert_not @user.valid?
  end

  test "password should be at least 6 characters long" do 
  	@user.password = "a" * 5
  	assert_not @user.valid?
  end

  test "password should not be longer than 50 characters" do 
  	@user.password = 'a' * 51
  	assert_not @user.valid?
  end
end
