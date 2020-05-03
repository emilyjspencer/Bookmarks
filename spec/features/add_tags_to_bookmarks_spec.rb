feature 'Add tags' do
  feature 'a user can add a tag to a bookmark' do
    scenario 'a tag can be added to a bookmark' do
      bookmark = Bookmark.create(url: 'https://www.freecodecamp.org/', title: 'freeCodeCamp')
      visit '/bookmarks'
      first('.bookmark').click_button 'Click to add a tag'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"
      fill_in 'tag', with: 'Great website!'
      click_button 'Submit'
      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'Great website!'
    end
  end
end