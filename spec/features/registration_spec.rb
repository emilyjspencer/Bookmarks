feature 'registration' do
  scenario 'a user can register for an account' do
    visit '/'
    click_button('Click here to sign up for an account')
    visit('/users/new')
    fill_in('username', with: 'emilyjane')
    fill_in('email', with: 'emily@example.com')
    fill_in('password', with: '12345')
    click_button('Submit')
    visit('/bookmarks')
    expect(page).to have_content "Comments"
  end
end