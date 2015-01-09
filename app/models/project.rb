class Project < ActiveRecord::Base
  validates :name, :description, :tech, :url, presence: true

  def tech_array
    tech.nil? ? [] : tech.split
  end
end

