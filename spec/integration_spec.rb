require('capybara/rspec')
require('./app')
require('spec_helper')
require('pry')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the index path', {:type => :feature}) do
   it('allows a user to select librarian and visit the page') do
     visit('/')
     click_link('Librarian')
     expect(page).to have_content('Hi Librarian')
   end

  it('allows a user to select patron and visit the page') do
    visit('/')
    click_link('Patron')
    expect(page).to have_content('Hi Patron')
  end
end

describe('the librarian path', {:type => :feature}) do
  it('allows user to add a book') do
    visit('/librarian')
    click_link('Copies Form')
    expect(page).to have_content('Book Form')
  end

  
end
