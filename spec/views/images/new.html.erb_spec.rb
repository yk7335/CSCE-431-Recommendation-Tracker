# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'images/new', type: :view do
  before(:each) do
    assign(:image, Image.new(
                     uin: 'MyString',
                     photo: 'MyString'
                   ))
  end

  it 'renders new image form' do
    render

    assert_select 'form[action=?][method=?]', images_path, 'post' do
      assert_select 'input[name=?]', 'image[uin]'

      assert_select 'input[name=?]', 'image[photo]'
    end
  end
end
