#!/usr/bin/env ruby

#require 'flickraw'
require 'flickraw-cached'
FlickRaw.api_key = 'beb5b073c4f46aa96dc9267c4fcc8be9'
FlickRaw.shared_secret = '30201065aa9d8eb1'

#list = flickr.photos.getRecent

#id = list[0].id
#secret = list[0].secret
#info = flickr.photos.getInfo :photo_id => id, :secret => secret

#puts info.title
#puts info.dates.taken

#sizes = flickr.photos.getSizes :photo_id => id

#original = sizes.find {|s| s.label == 'Original'}
#puts original.width



token = flickr.get_request_token
auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

puts "Open this url in your process to complete the authication process : #{auth_url}"
puts "Copy here the number given when you complete the process."
verify = gets.strip
#verify = '976-112-948'

begin
  flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
  login = flickr.test.login
  puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
rescue FlickRaw::FailedResponse => e
  puts "Authentication failed : #{e.msg}"
end

#puts 'Image path:'
#path = gets.chomp
path = '/Users/abhishekanand/Desktop/loading.png'
# You need to be authentified to do that, see the previous examples.
flickr.upload_photo path, :title => "Title", :description => "This is the description"
