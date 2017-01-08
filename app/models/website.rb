class Website < ActiveRecord::Base

  belongs_to :site

  validates :domain, 
  	presence: true,
    uniqueness: { case_sensitive: false }

end
