feature 'Adding a new bookmark' do
  scenario 'A user can add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    click_button('Submit')
    expect(page).to have_content 'http://www.google.com'
  end
end