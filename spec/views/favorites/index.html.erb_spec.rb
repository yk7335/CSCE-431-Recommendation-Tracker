require 'rails_helper'

RSpec.describe "favorites/index", type: :view do
  before(:each) do
    assign(:favorites, [
      Favorite.create!(
        lastname: "Lastname",
        firstname: "Firstname",
        uin: "Uin",
        email: "Email",
        classname: "Classname",
        notes: "Notes",
        major: "Major",
        finalgrade: "Finalgrade",
        updatedgrade: "Updatedgrade",
        recletter: "Recletter",
        semester: "Semester",
        year: "Year"
      ),
      Favorite.create!(
        lastname: "Lastname",
        firstname: "Firstname",
        uin: "Uin",
        email: "Email",
        classname: "Classname",
        notes: "Notes",
        major: "Major",
        finalgrade: "Finalgrade",
        updatedgrade: "Updatedgrade",
        recletter: "Recletter",
        semester: "Semester",
        year: "Year"
      )
    ])
  end

  it "renders a list of favorites" do
    render
    assert_select "tr>td", text: "Lastname".to_s, count: 2
    assert_select "tr>td", text: "Firstname".to_s, count: 2
    assert_select "tr>td", text: "Uin".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Classname".to_s, count: 2
    assert_select "tr>td", text: "Notes".to_s, count: 2
    assert_select "tr>td", text: "Major".to_s, count: 2
    assert_select "tr>td", text: "Finalgrade".to_s, count: 2
    assert_select "tr>td", text: "Updatedgrade".to_s, count: 2
    assert_select "tr>td", text: "Recletter".to_s, count: 2
    assert_select "tr>td", text: "Semester".to_s, count: 2
    assert_select "tr>td", text: "Year".to_s, count: 2
  end
end
