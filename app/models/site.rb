# == Schema Information
# Schema version: 20110704144137
#
# Table name: sites
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Site < ActiveRecord::Base
	belongs_to :user

	attr_accessible :name, :url
	
	#url_regex = /^http:\/\/[\w+\-.]+\z/
	
	url_regex = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
	
	validates :name, :presence => true,
					 :length   => { :maximum => 100 },
					 :uniqueness => { :case_sensitive => false }
					 
	validates :url, :presence => true,
					 :length   => { :maximum => 100 },
					 :format   => { :with => url_regex },
					 :uniqueness => { :case_sensitive => false }
					 
		# validates :url, :presence => true,
					 # :length   => { :maximum => 100 }				 
					 
	#default_scope :order => 'sites.name ASC'				 

	# def to_param
  		#url #replace with anything that makes a URL-encoded string
		# "#{id}-#{name.parameterize}"
	# end
  
end
