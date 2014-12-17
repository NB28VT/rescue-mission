require 'rails_helper'
require_relative 'test_feed'

feature "User can answer another user's question" do

# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly



  it "can provide an answer on a question detail page" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path

    click_link QUESTION_TITLE

    fill_in "answer[description]", with: ANSWER_DESCRIPTION
    click_button "Submit"

    expect(page).to have_content(ANSWER_DESCRIPTION)

  end

  it "can't provide an answer less than 50 characters long" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path

    click_link QUESTION_TITLE

    fill_in "answer[description]", with: "Jane Addams local solutions"
    click_button "Submit"


    expect(page).to have_content "can't be less than 50 characters"
  end

end
