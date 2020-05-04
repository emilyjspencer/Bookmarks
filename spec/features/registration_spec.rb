feature 'registration' do
  scenario 'a user can register for an account' do
    visit '/users/new'
    fill_in('username', with: 'emilyjane')
    fill_in('email', with: 'emily@example.com')
    fill_in('password', with: '12345')
    click_button('Submit')
    expect(page).to have_content "Welcome, emilyjane"
  end
end