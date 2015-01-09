require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'should not save without validations' do
    project = Project.new
    assert_not project.save
  end

  test '#tech_array should convert tech to array' do
    project = Project.create!(name: 'new', description: 'cool', url: 'test.com',
                              tech: 'JavaScript, Rails, CSS')
    assert_equal ['JavaScript', 'Rails', 'CSS'], project.tech_array
  end
end
