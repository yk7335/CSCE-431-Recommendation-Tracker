json.extract! favorite, :id, :lastname, :firstname, :uin, :email, :classname, :notes, :major, :finalgrade, :updatedgrade, :recletter, :semester, :year, :created_at, :updated_at
json.url favorite_url(favorite, format: :json)
