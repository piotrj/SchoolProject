Factory.define(:user_role) do |user_role|
  user_role.name "admin"
end

Factory.define(:user) do |user|
  user.email                 "user@example.com"
  user.password              "secret"
  user.password_confirmation "secret"
  user.user_role { |role| role.association(:user_role, :name=>"admin")}
end

Factory.define(:school_test) do |school_test|
  school_test.name  "test"
  school_test.association :user
  school_test.password "secret"
  school_test.password_confirmation "secret"
  school_test.expiry_date (Time.now + 5.hours)
end

Factory.define(:question) do |question|
  question.name  "Question 1"
end

Factory.define(:category) do |category|
  category.name  "Category 1"
end