feature 'Authentication' do
  scenario 'Successful log in' do
    User.create(username: 'emilyjane', email: 'emily@example.com', password: '12345')
    visit '/sessions/new'
    fill_in :username, with: 'emilyjane'
    fill_in :email, with: 'emily@example.com'
    fill_in :password, with: '12345'
    click_button('Log in')
    expect(page).to have_content 'Welcome, emilyjane'
  end
end