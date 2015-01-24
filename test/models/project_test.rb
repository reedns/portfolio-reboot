require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'should not save without validations' do
    project = Project.new
    assert_not project.save
  end

  test '#tech_array should convert tech to array' do
    project = Project.create(
                              name: 'new',
                              description: 'cool', 
                              url: 'test.com',
                              tech: 'JavaScript, Ruby on Rails, CSS',
                              image: 'image'
                            )
    assert_equal ['JavaScript', 'Ruby on Rails', 'CSS'], project.tech_array
  end

  test '#complete_url should return a complete url' do
    project = create(:no_http_project)
    project2 = create(:no_www_project)

    assert_equal 'http://www.google.com', project.complete_url
    assert_equal 'http://www.google.com', project2.complete_url
  end

  test '#complete_url should return the url if the url is complete' do
    project3 = create(:project)
    assert_equal project3.complete_url, project3.url
  end

  test '#complete_url should not change the url attribute' do
    project = create(:no_http_project)
    assert_not_equal project.complete_url, project.url
  end
end
