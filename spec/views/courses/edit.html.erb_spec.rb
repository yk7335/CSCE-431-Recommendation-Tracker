require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      classname: "MyString",
      semester: "MyString",
      year: "MyString"
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[classname]"

      assert_select "input[name=?]", "course[semester]"

      assert_select "input[name=?]", "course[year]"
    end
  end
end
