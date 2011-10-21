Factory.define :user do |u|
  u.name "Aditya Swaroop"
  u.username "aditya"
  u.email "adi@gmail.com"
  u.password "aditya"
end

Factory.define :role do |r|
  r.role_type "Admin"
end