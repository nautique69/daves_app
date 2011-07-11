class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include SiteconfigsHelper


 #  ActiveRecord::Base.establish_connection(
	# :adapter => 'sqlserver',
	# :host => 'localhost',
	# :username => 'name',
	# :password => 'password',
	# :database => 'db_name'
	# )

end
