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
    fill_in "question[title]", with: "What the fuck this is such a long question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit??"
    click_button "Submit"
    expect(Question.count).to eq(1)
  end

  it "can't create a new question with a title less than 40 characters long" do
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck?"
    fill_in "question[description]", with: "What the fuck is up with this shit?"
    click_button "Submit"
    expect(page).to have_content "Title can't be less than 40 characters"
  end

  it "can't create a new question with a description less than 150 characters long" do
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck?"
    fill_in "question[description]", with: "What the fuck is up with this shit?"
    click_button "Submit"
    expect(page).to have_content "Description must be at least 150 characters"
  end
end
