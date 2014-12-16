require 'rails_helper'
require_relative 'test_feed'


feature "User can post a question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others
  #
  # Acceptance Criteria
  #
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly
  #
  #

  it "can create a new question" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"
    expect(Question.count).to eq(1)
  end

  it "can't create a new question with a title less than 40 characters long" do
    visit '/questions/new'
    fill_in "question[title]", with: "Political social"
    fill_in "question[description]", with: "Political social analysis impact"
    click_button "Submit"
    expect(page).to have_content "Title can't be less than 40 characters"
  end

  it "can't create a new question with a description less than 150 characters long" do
    visit '/questions/new'
    fill_in "question[title]", with: "Rosa Parks Bloomberg solve combat malaria"
    fill_in "question[description]", with: "Crowdsourcing collaborative consumption"
    click_button "Submit"
    expect(page).to have_content "Description must be at least 150 characters"
  end
end
