require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    
    before { visit root_path }
    
    it "should have the h1 'Mi Buen Consultorio'" do
      page.should have_selector('h1', :text => 'Mi Buen Consultorio')
    end

    it "should have the title 'Home'" do
      page.should have_selector('title',
                        :text => "Mi Buen Consultorio | Home")
    end
    
    describe "for signed in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Good day")
        sign_in user
        visit root_path
      end
      
      it "should render the user feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
      
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { page.should have_link("0 following", href: following_user_path(user)) }
        it { page.should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end

  describe "Help page" do

    before { visit help_path }

    it "should have the h1 'Help'" do
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      page.should have_selector('title',
                        :text => "Mi Buen Consultorio | Help")
    end
  end

  describe "About page" do

    before { visit about_path }

    it "should have the h1 'About Us'" do
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About'" do
      page.should have_selector('title',
                        :text => "Mi Buen Consultorio | About")
    end
  end

  describe "Contact page" do

    before { visit contact_path }

    it "should have the h1 'Contact'" do
      page.should have_selector('h1', :text => 'Contact')
    end

    it "should have the title 'Contact'" do
      page.should have_selector('title',
                        :text => "Mi Buen Consultorio | Contact")
    end
  end

end
