feature 'Adding a new bookmark' do
  scenario 'A user can add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'Google')
    click_button('Submit')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end