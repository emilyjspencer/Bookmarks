feature 'Deleting bookmarks' do
  scenario 'A user can delete a bookmark' do
    Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
    visit('/bookmarks')
    expect(page).to have_link(href: 'http://www.facebook.com')
    expect(page).to have_content('Facebook')
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link(href: 'http://www.facebook.com')
    expect(page).not_to have_content('Facebook')
  end
end