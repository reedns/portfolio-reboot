require 'test_helper'

class ListingProjectsTest < ActionDispatch::IntegrationTest
  test 'listing projects' do
    setup do
      @project = Project.create!(name: 'New', description: 'Cool', tech: 'Ruby')
      @project2 = Project.create!(name: 'New', description: 'Cool', tech: 'Ruby')
    end

    get '/api/projects'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal Project.count, JSON.parse(response.body).size
  end
end
