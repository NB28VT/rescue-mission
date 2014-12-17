require 'rails_helper'
require_relative 'test_feed'


feature "User can view details of a question" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  it "can get to this page from the questions index" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION

    click_button "Submit"

    visit questions_path
    
    click_link QUESTION_TITLE

    expect(page).to have_content(QUESTION_DESCRIPTION)
  end
end
