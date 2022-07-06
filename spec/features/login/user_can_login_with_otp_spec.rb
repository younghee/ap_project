# require 'rails_helper'
#
# feature 'User with OTP two factor enabled' do
#   scenario 'cannot login without a valid OTP' do
#
#     user = create(:user, :with_otp)
#     visit root_path
#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: 'letmein'
#     click_button 'Log in'
#
#
#     fill_in 'OTP', with: 'invalid-otp'
#     click_button 'Log in'
#
#
#     expect(page).to have_content("Invalid two-factor code.")
#   end
#   scenario 'can login when providing a valid OTP' do
#
#     user = create(:user, :with_otp)
#     visit root_path
#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: 'letmein'
#     click_button 'Log in'
#
#     fill_in 'OTP', with: user.current_otp
#     click_button 'Log in'
#     expect(current_path).to eq(root_path)
#     #expect(page).to have_content("You are currently logged in as #{user.email}.")
#   end
# end