require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/copy'
require './lib/patron'
require 'pg'
# require 'spec_helper'


get('/') do
  erb(:index)
end

get('/librarian') do
 erb(:librarian)
end

get('/patron') do
  erb(:patron)
end

post('/copies') do
  title = params.fetch("title")
  copy = Copy.new({:title => title, :id => nil})
  copy.save()
  @copies = Copy.all()
  erb(:copies)
end

get('/copies/new') do
  erb(:copy_form)
end
