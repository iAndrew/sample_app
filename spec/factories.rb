Factory.define  :user do |user|
  user.name                     "John Doe"
  user.email                    "john.doe@gmail.com"
  user.password                 "foobar"
  user.password_confirmation    "foobar"
end