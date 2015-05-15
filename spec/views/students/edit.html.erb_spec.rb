require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :name => "MyString",
      :tagline => "MyString",
      :image_url => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_name[name=?]", "student[name]"

      assert_select "input#student_tagline[name=?]", "student[tagline]"

      assert_select "input#student_image_url[name=?]", "student[image_url]"
    end
  end
end
