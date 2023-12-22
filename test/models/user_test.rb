require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new( name: "Example User", email: "User@example.com",
                      password: "shrimp",   password_confirmation: "shrimp")
  end

  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    assert @user.name = "    "
    assert_not @user.valid? 
  end
  
  test "email should be present" do
    assert @user.email = "    "
    assert_not @user.valid? 
  end
  
  test "name should not be too long" do
    assert @user.name = "a" * 51
    assert_not @user.valid? 
  end
  
  test "email should not be too long" do
    assert @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid? 
  end

  test "email validation should accept valid emails" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org 
      first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lowercase" do 
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email 
  end

  test "password should be present (non-blank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password has a minimum length of 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end