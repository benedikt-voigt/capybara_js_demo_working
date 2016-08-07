require 'test_helper'
require "database_cleaner"

class CreateFooTest < Capybara::Rails::TestCase

  test 'one' do
    create_foo
  end
  test 'two' do
    create_foo
  end

  def create_foo
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    Capybara.current_driver = :selenium
    visit '/'
    click_on 'New Foo'
    fill_in 'Name', with: 'Bar'
    click_on 'Create Foo'
    assert_no_content page, 'Name has already been taken'
    DatabaseCleaner.clean
  end
end
