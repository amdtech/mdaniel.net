require 'bundler'
Bundler.require

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  haml :index
end

get '/:page' do |page|
  @title = page.capitalize
  begin
    haml page.to_sym
  rescue Errno::ENOENT
    404
  end
end

not_found do
  haml :pnf
end
