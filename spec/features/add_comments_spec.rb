feature 'Add comments' do
  feature 'a user can add comments to bookmarks' do
    scenario 'a comment is added to a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      visit '/bookmarks'
      first('.bookmark').click_button 'Click to add a comment'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
      fill_in 'comment', with: "This is a great website!"
      click_button 'Submit'
      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content "This is a great website!"
    end
  end
end