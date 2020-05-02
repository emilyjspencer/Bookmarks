
  feature 'See bookmarks' do
   scenario 'A user can see a bookmark url' do
     Bookmark.create(url: "http://www.google.com")
     visit('/bookmarks/index')
     expect(page).to have_content("http://www.google.com")
   end
  end