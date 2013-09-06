require 'bundler'
Bundler.require

set :public_folder, File.dirname(__FILE__) + '/public'

before do
  unless request.host == "www.amdte.ch" || request.host == "localhost"
    redirect "http://www.amdte.ch" + request.path_info, 301
  end

  redirect "http://about.me/amdtech", 301
end

get '/' do
  haml :index
end

get '/:page' do |page|
  page = "index" if page == "index.php"
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
