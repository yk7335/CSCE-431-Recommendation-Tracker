# frozen_string_literal: true

json.extract! student, :id, :email, :firstname, :lastname, :notes, :uin, :major, :finalgrade, :updatedgrade,
              :created_at, :updated_at
json.url student_url(student, format: :json)
