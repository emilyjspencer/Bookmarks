
  feature 'See bookmarks' do
   scenario 'A user can see a bookmark url' do
     Bookmark.create(url: 'http://www.google.com', title: 'Google')
     visit('/bookmarks')
     expect(page).to have_link('Google', href: 'http://www.google.com')
   end
  end

  