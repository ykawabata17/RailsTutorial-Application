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

  # 長さの検証(user name)
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # 長さの検証(email)
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # フォーマットの検証(有効性)
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # フォーマットの検証(無効性)
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert @user.invalid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  # 一意性の検証
  test "email addresses should be unique" do
    # .dupで同じ属性を持つデータを複製する
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
