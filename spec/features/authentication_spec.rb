feature 'Authentication' do
  scenario 'Successful log in' do
    visit('/')
    click_button('Click here to sign up for an account')
    visit('/users/new')
    fill_in 'username', with: 'emilyjane'
    fill_in 'email', with: 'emily@example.com'
    fill_in 'password', with: '12345'
    click_button('Submit')
    visit('/bookmarks')
    click_button('Log out')
    visit('/')
    click_button('Log in')
    visit '/sessions/new'
    fill_in :username, with: 'emilyjane'
    fill_in :email, with: 'emily@example.com'
    fill_in :password, with: '12345'
    click_button('Log in')
    expect(page).to have_button 'Add a new bookmark'
  end

  scenario 'unsuccessful log in - incorrect email address' do
    visit('/')
    click_button('Click here to sign up for an account')
    visit('/users/new')
    fill_in 'username', with: 'emilyjane'
    fill_in 'email', with: 'emily@example.com'
    fill_in 'password', with: '12345'
    click_button('Submit')
    visit('/bookmarks')
    click_button('Log out')
    visit('/')
    click_button('Log in')
    visit '/sessions/new'
    fill_in :username, with: 'emilyjane'
    fill_in :email, with: 'em@example.com'
    fill_in :password, with: '12345'
    click_button('Log in')
    expect(page).to have_content 'Incorrect login information. Please try again.'
  end

  scenario 'unsuccessful login - incorrect password' do
    visit('/')
    click_button('Click here to sign up for an account')
    visit('/users/new')
    fill_in 'username', with: 'emilyjane'
    fill_in 'email', with: 'emily@example.com'
    fill_in 'password', with: '12345'
    click_button('Submit')
    visit('/bookmarks')
    click_button('Log out')
    visit('/')
    click_button('Log in')
    visit '/sessions/new'
    fill_in :username, with: 'emilyjane'
    fill_in :email, with: 'emily@example.com'
    fill_in :password, with: '123'
    click_button('Log in')
    expect(page).not_to have_button 'Add a new bookmark'
    expect(page).to have_content 'Incorrect login information. Please try again.'
  end

  scenario 'log out' do
    visit('/')
    click_button('Click here to sign up for an account')
    visit('/users/new')
    fill_in 'username', with: 'emilyjane'
    fill_in 'email', with: 'emily@example.com'
    fill_in 'password', with: '12345'
    click_button('Submit')
    visit('/bookmarks')
    click_button('Log out')
    visit('/')
    expect(page).not_to have_button 'Add a new bookmark'
    expect(page).to have_content 'For saving all your favourite websites'
  end
end