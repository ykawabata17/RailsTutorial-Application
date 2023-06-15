require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  # 有効性の検証
  test "should be valid" do
    assert @user.valid?
  end

  # 存在性の検証(user name)
  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  # 存在性の検証(email)
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
end
