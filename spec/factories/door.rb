FactoryBot.define do
  factory :door do
    name { "An Exit [E]" }
    description  { "A door. Made of wood" }
    room_id {1}
    exit_id {1}
  end
end