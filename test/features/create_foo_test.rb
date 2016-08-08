require 'test_helper'

class CreateFooTest < Capybara::Rails::TestCase

  test 'one' do
    create_foo
  end
  test 'two' do
    create_foo
  end

  def create_foo
    Capybara.current_driver = :selenium
    visit '/'
    click_on 'New Foo'
    fill_in 'Name', with: 'Bar'
    click_on 'Create Foo'
    page.assert_text 'Foo was successfully created.'
  end
end
