require 'spec_helper'

describe "Pages" do
  
  before(:each) do
    @user = Factory(:user)
    integration_sign_in(@user)
  end
  
  describe "GET 'home'" do
    
    describe "micropost attributes for sidebar" do
        
        describe "for 1 post" do
          
          before(:each) do
            @mp1 = "Content"
            Factory(:micropost, :user => @user)
          end
          
          it "should equal number of 1 post" do
            one_regex = /1 micropost/
            visit root_path
            response.should have_selector("microposts") do |one|
              one.should contain(one_regex)
            end
          end
          
        end
        
        describe "for 2 posts" do
          
          before(:each) do
            two_regex = /2 microposts/
            @mp1 = "Content"
            @mp2 = "More content"
            Factory(:micropost, :user => @user)
            Factory(:micropost, :user => @user)
          end
          
          it "should equal number of 2 posts" do
            visit root_path
            response.should have_selector("span.microposts", :content => "2 microposts")
          end
        
        end
        
    end
  end
end
