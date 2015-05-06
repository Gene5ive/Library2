require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index/librarian path', {:type => :feature}) do
   it('allows a user to identify as a librarian and visit the page') do
     visit('/')
     click_link('Librarian')
     expect(page).to have_content('Hi Librarian')
   end

  it('allows librarian to add a book copy') do
    visit('/librarian')
    click_link('Copies Form')
    expect(page).to have_content('Book Form')
  end

  it('shows the librarian the success page') do
    visit('/copies/new')
    fill_in('Copy', with: "The Giver")
    click_button('Add Copy')
    expect(page).to have_content("Success!")
  end
end

describe('the index/patron path', {:type => :feature}) do
  it('allows a user to identify as a patron and visit the page') do
    visit('/')
    click_link('Patron')
    expect(page).to have_content('Hi Patron')
  end

  it('allows patron to add themselves to membership list') do
    visit('/patron')
    click_link('Patron Form')
    expect(page).to have_content('Patron Form')
  end

  it('shows the patron the success page') do
    visit('/patrons/new')
    fill_in('Patron', with: "Bob")
    click_button('Get Library Card')
    expect(page).to have_content("Success!")
  end

  # it('shows the patron their page') do
  #   visit('/patrons')
  #   click_link('Bob')
  #   expect(page).to have_content('blahblah')
  # end

end
