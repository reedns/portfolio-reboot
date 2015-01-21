class Project < ActiveRecord::Base
  validates :name, :description, :tech, :url, presence: true

  def tech_array
    tech.nil? ? [] : tech.split(/,/).map { |e| e.delete(',').strip }
  end

  def make_url
    return self.url if self.url.include?('http://')
    self.url.include?('www.') ? self.url = 'http://' + self.url : 'http://www.' + self.url
  end
end
