class Siteconfig < ActiveRecord::Base
	belongs_to :site

	attr_accessible :db, :status, :site_id, :type, :user, :password

	validates :db, :presence => true,
				   :length   => { :maximum => 50 }
	validates :username, :length => { :maximum => 50 }
	validates :dbtype, :length => { :maximum => 50 }
	validates :password, :length => { :maximum => 50 }	


	 def to_param
  		#url #replace with anything that makes a URL-encoded string
		 "#{id}-#{name.parameterize}"
	 end
end
