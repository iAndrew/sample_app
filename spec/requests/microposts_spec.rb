require 'spec_helper'
include ActionView::Helpers::TextHelper

describe "Microposts" do
  before(:each) do
    @user = Factory(:user)
    integration_sign_in @user
  end
  
  describe "creation" do
    describe "failure" do
      it "should not make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Micropost, :count)
      end
    end
    
    describe "success" do
      before(:each) do
        @content = "Lorem ipsum dolor sit amet"
      end
      
      it "should make a new micropost" do
        lambda do
          visit root_path
          fill_in :micropost_content, :with => @content
          click_button
          response.should have_selector("span.content", :content => @content)
          amount = @user.microposts.count
          response.should have_selector("span", :class => "microposts", :content => pluralize(amount, "microposts"))
        end.should change(Micropost, :count).by(1)
      end
    end
  end
end
