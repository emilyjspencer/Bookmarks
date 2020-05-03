
  feature 'Edit bookmarks' do
    scenario 'A user can see an edit button' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      visit('/bookmarks')
      expect(page).to have_link(href: 'http://www.google.com')
      expect(page).to have_button('Edit')
    end

    scenario 'A user can edit a bookmark' do
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
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