require 'bundler'
Bundler.require

set :public_folder, File.dirname(__FILE__) + '/public'

before do
  unless request.host == "www.mdaniel.net" || request.host == "localhost"
    redirect "http://www.mdaniel.net" + request.path_info, 301
  end
end

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
