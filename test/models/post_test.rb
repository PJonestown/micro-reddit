require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@post = Post.new(title: 'Foo', body: 'bar', user_id: 1)
  end

  test "is valid" do 
  	assert @post.valid?
  end

  test "should have title" do 
  	@post.title = ''
  	assert_not @post.valid?
  end

  test "should not be too long" do 
  	@post.title = 'a' * 141
  	assert_not @post.valid?
  end

  test "title should be unique" do 
  	duplicate_post = @post.dup 
  	duplicate_post.title = @post.title.upcase
  	@post.save
  	assert_not duplicate_post.valid?
  end

  test "body should be present" do 
  	@post.body = ''
  	assert_not @post.valid?
  end
end
