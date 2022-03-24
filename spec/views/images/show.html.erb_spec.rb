require 'rails_helper'

RSpec.describe "images/show", type: :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      uin: "Uin",
      photo: "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Uin/)
    expect(rendered).to match(/Photo/)
  end
end
