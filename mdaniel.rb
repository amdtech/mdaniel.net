require 'bundler'
Bundler.require

get '/' do
  haml :index
end

get '/:page' do |page|
  pass if page == "favicon.ico"
  begin
    haml page.to_sym
  rescue Errno::ENOENT
    404
  end
end

not_found do
  haml :pnf
end
