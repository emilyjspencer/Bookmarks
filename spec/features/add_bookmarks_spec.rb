feature 'Adding a new bookmark' do
  scenario 'A user can add a new bookmark' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'Google')
    click_button('Submit')
    expect(page).to have_link(href: 'http://www.google.com')
  end

  scenario 'A user will receive a notification if they enter an invalid email' do
    visit('/bookmarks/new')
    fill_in('title', with: 'Phoney')
    fill_in('url', with: 'w.w.t.r.imafake')
    click_button('Submit')
    expect(page).not_to have_content 'Phoney'
    expect(page).to have_content 'Please submit a valid url'
  end
end