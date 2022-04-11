require 'rails_helper'

RSpec.describe "favorites/show", type: :view do
  before(:each) do
    @favorite = assign(:favorite, Favorite.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Uin/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Classname/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(/Major/)
    expect(rendered).to match(/Finalgrade/)
    expect(rendered).to match(/Updatedgrade/)
    expect(rendered).to match(/Recletter/)
    expect(rendered).to match(/Semester/)
    expect(rendered).to match(/Year/)
  end
end
