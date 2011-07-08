class Siteconfig < ActiveRecord::Base
	belongs_to :site

	attr_accessible :db, :status, :site_id

	validates :db, :presence => true,
				   :length   => { :maximum => 250 }


	 def to_param
  		#url #replace with anything that makes a URL-encoded string
		 "#{id}-#{name.parameterize}"
	 end
end
