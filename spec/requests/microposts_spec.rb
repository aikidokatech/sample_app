require 'spec_helper'

describe "Microposts" do

  before(:each) do
    @user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => @user.email
    fill_in :password, :with => @user.password
    click_button
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

      it "should make a new micropost" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector("span.content", :content => content)
        end.should change(Micropost, :count).by(1)
      end

    end
  end

  describe "show" do

    it "should have pagination" do
      @attr = { :content => "Lorem ipsum" }
      50.times do
        @user.microposts.create!(:content => @attr)
      end
      visit root_path
      response.should have_selector("div.pagination")
    end

    it "should show proper pluralization for one post" do
      @attr = { :content => "First post" }
      @user.microposts.create!(:content => @attr)
      visit root_path
      response.should have_selector("span.microposts", :content => "1 micropost")
    end

    it "should show proper pluralization for more than one post" do
      @attr = { :content => "First post" }
      @user.microposts.create!(:content => @attr)
      @attr = { :content => "Second post" }
      @user.microposts.create!(:content => @attr)
      visit root_path
      response.should have_selector("span.microposts", :content => "2 microposts")
    end

    it "should not show delete for another user's posts" do
      @attr = { :content => "First post" }
      @user.microposts.create!(:content => @attr)
      visit signout_path

      visit signin_path
      fill_in :email,    :with => "user2@example.com"
      fill_in :password, :with => "Jane Doe"
      click_button
      
      visit "users/1"
      response.should_not have_selector("a", :content => "delete")

    end

  end

end
