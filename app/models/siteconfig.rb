class Siteconfig < ActiveRecord::Base
	belongs_to :site

	attr_accessible :db, :status, :site_id

	# def to_param
  		#url #replace with anything that makes a URL-encoded string
		# "#{id}-#{name.parameterize}"
	# end
end
