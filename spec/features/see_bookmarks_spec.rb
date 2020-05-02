
  feature 'See bookmarks' do
   scenario 'A user can see a bookmark url' do
     Bookmark.create(url: "http://www.google.com", title: 'Google')
     visit('/bookmarks/index')
     expect(page).to have_content("http://www.google.com")
     expect(page).to have_content("Google")
   end
  end