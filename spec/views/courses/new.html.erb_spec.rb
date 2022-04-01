require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      classname: "MyString",
      semester: "MyString",
      year: "MyString"
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[classname]"

      assert_select "input[name=?]", "course[semester]"

      assert_select "input[name=?]", "course[year]"
    end
  end
end
