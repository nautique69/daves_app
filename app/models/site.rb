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
	
	url_regex = /\A\http:\/\/[\w+\-.]+/
	
	validates :name, :presence => true,
					 :length   => { :maximum => 100 }
					 
	validates :url, :presence => true,
					 :length   => { :maximum => 100 },
					 :format   => { :with => url_regex }
end
