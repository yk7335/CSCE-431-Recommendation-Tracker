require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      classname: "Classname",
      semester: "Semester",
      year: "Year"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Classname/)
    expect(rendered).to match(/Semester/)
    expect(rendered).to match(/Year/)
  end
end
