require 'spec_helper'

describe User do

	before { @user = User.new(first_name: "Example", last_name: "User", user_name: "username", email: "user@example.com") }

	subject { @user }

	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:user_name) }
	it { should respond_to(:email) }
end