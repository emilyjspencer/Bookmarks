feature 'See bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "https://www.theguardian.com/uk"
    expect(page).to have_content "https://www.bbc.co.uk/news"
    expect(page).to have_content "http://www.google.com"
  end
end