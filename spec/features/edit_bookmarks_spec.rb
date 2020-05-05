
  feature 'Edit bookmarks - see edit button' do
    scenario 'A user can see an edit button' do
      visit('/')
      click_button('Click here to sign up for an account')
      visit('/users/new')
      fill_in 'username', with: 'emilyjane'
      fill_in 'email', with: 'emily@example.com'
      fill_in 'password', with: '12345'
      click_button('Submit')
      visit('/bookmarks')
      click_button('Add a new bookmark')
      fill_in 'title', with: 'Google'
      fill_in 'url', with: 'http://www.google.com'
      click_button('Submit')
      visit('/bookmarks')
      expect(page).to have_link(href: 'http://www.google.com')
      expect(page).to have_button('Click to edit')
    end
  end 


  feature 'Edit bookmarks - edit' do
    scenario 'A user can edit a bookmark' do
      visit('/')
      click_button('Click here to sign up for an account')
      visit('/users/new')
      fill_in 'username', with: 'emilyjane'
      fill_in 'email', with: 'emily@example.com'
      fill_in 'password', with: '12345'
      click_button('Submit')
      visit('/bookmarks')
      click_button('Add a new bookmark')
      fill_in 'username', with: 'emilyjane'
      fill_in 'email', with: 'emily@example.com'
      fill_in 'password', with: '12345'
      click_button('Submit')
      click_button('Click to edit')
      fill_in 'title', with: 'Google'
      fill_in 'url', with: 'http://www.google.com'
      click_button('Submit')
      visit('/bookmarks')
      expect(page).to have_link(href: 'http://www.google.com')
      first('.bookmark').click_button 'Edit'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
      fill_in('url', with: 'http://www.instagram.com')
      fill_in('title', with: 'Instagram')
      click_button('Submit')
      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link(href: 'http://www.google.com')
      expect(page).to have_link(href: 'http://www.instagram.com')
    end
  end