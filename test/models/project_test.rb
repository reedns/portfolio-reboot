require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'should not save without validations' do
    project = Project.new
    assert_not project.save
  end

  test '#tech_array should convert tech to array' do
    project = Project.create!(name: 'new', description: 'cool', url: 'test.com',
                              tech: 'JavaScript, Ruby on Rails, CSS')
    assert_equal ['JavaScript', 'Ruby on Rails', 'CSS'], project.tech_array
  end

  test '#make_url should return a complet url' do
    project = create(:broken_url)
    project2 = create(:broken_url2)
    project3 = create(:project)

    assert_equal 'http://www.google.com', project.make_url
    assert_equal 'http://www.google.com', project2.make_url
    assert project.make_url.include?('http://')
  end
end
