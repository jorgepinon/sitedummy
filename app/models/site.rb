class Site < ActiveRecord::Base

  has_one :website, dependent: :destroy

  validates :name, presence: true
  validates :domain, 
    length: { minimum: 3, maximum: 15 },
    uniqueness: { case_sensitive: false }, 
    exclusion: { in: %w(admin www), message: "%{value} is reserved." },
    allow_blank: true


  private

  def strip_input_fields
    self.attributes.each do |key, value|
      self[key] = value.strip if value.respond_to?("strip")
    end
  end

end
