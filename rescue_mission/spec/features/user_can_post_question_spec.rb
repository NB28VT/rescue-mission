require 'rails_helper'


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
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck?"
    fill_in "question[description]", with: "What the fuck is up with this shit?"
    click_button "Submit"
    expect(Question.count).to eq(1)
  end








end
