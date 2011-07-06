class Siteconfig < ActiveRecord::Base
	belongs_to :site

	attr_accessible :db, :status


end
