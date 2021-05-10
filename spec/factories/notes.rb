FactoryBot.define do
  factory :note do
    message "My Important note."
    association :project
    user { project.owner }
  end
end
