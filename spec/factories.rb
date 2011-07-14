Factory.define :user do |f|
  f.first_name 'John'
  f.last_name 'Doe'
  f.password 'password'
  f.email { Factory.next(:email) }
end  

Factory.define :admin, :parent => :user do |f|
  f.role 'admin'
end  

Factory.define :quest do |f|
  f.title 'Quest'
  f.description 'Description'
  f.date Date.today
  f.meeting_place 'High Street'
  f.meeting_at Time.new
  f.start_at { |f| f.meeting_at + 1.hour }
end  

Factory.define :user_quest do |f|
  f.association :user
  f.association :quest
end

Factory.define :comment do |f|
  f.association :quest
  f.message 'Comment'
  f.author 'John Doe'
end

Factory.define :map do |f|
  f.association :user
  f.association :quest
end

Factory.define :placemark do |f|
  f.association :map
  f.name 'Point'
  f.lat 37.609218
  f.lng 55.753559
end

Factory.define :polyline do |f|
  f.association :map
  f.encoded_points "kjU9AkM1UwMUmv__V6v__8G7AADO5___"
end

Factory.sequence :email do |n|
  "email#{n}@example.com"
end
