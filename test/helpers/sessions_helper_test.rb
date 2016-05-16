require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  
  def setup
    @user = users(:michael)
    remember(@user)
  end
  
  test "current user returns right user when session is nil" do
    log_in_as(@user) #added per stackoverflow to solve failing test
    assert_equal @user, current_user
    assert is_logged_in?
  end
  
  test "current user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))    
    assert_nil current_user
  end
end