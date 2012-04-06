require 'spec_helper'

describe "UserPages" do
  # variable page is the subject of the test and it is included as page.should
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: 'Ruby on Rails Tutorial Sample App | Sign up') }
  end
end
