module Helpers
  def login(email, password)
    visit new_user_session_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    click_button "Log in"
  end

  def sign_in(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return user
    allow_any_instance_of(ApplicationController).to receive(:authenticate_user!).and_return true
  end
end