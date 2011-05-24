Factory.define :user do |f|
  f.first_name 'John'
  f.last_name 'Doe'
  f.password 'password'
  f.email { Factory.next(:email) }
end  

Factory.sequence :email do |n|
  "email#{n}@example.com"
end
