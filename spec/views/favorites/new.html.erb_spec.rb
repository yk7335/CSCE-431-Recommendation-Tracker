require 'rails_helper'

RSpec.describe "favorites/new", type: :view do
  before(:each) do
    assign(:favorite, Favorite.new(
      lastname: "MyString",
      firstname: "MyString",
      uin: "MyString",
      email: "MyString",
      classname: "MyString",
      notes: "MyString",
      major: "MyString",
      finalgrade: "MyString",
      updatedgrade: "MyString",
      recletter: "MyString",
      semester: "MyString",
      year: "MyString"
    ))
  end

  it "renders new favorite form" do
    render

    assert_select "form[action=?][method=?]", favorites_path, "post" do

      assert_select "input[name=?]", "favorite[lastname]"

      assert_select "input[name=?]", "favorite[firstname]"

      assert_select "input[name=?]", "favorite[uin]"

      assert_select "input[name=?]", "favorite[email]"

      assert_select "input[name=?]", "favorite[classname]"

      assert_select "input[name=?]", "favorite[notes]"

      assert_select "input[name=?]", "favorite[major]"

      assert_select "input[name=?]", "favorite[finalgrade]"

      assert_select "input[name=?]", "favorite[updatedgrade]"

      assert_select "input[name=?]", "favorite[recletter]"

      assert_select "input[name=?]", "favorite[semester]"

      assert_select "input[name=?]", "favorite[year]"
    end
  end
end
