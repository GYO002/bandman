FactoryBot.define do
  factory :user do
   
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {'000000'}
    name                  {'test'}
    gender                {'test'}
    age                   {'test'}
    inst                  {'test'}
    skill                 {'test'}
    remarks               {'test'}
  end
end