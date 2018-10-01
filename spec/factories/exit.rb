FactoryBot.define do
  factory :exit do
    name { "An Exit [E]" }
    description  { "A door. Made of wood" }
    room_id {1}
    passage_id {1}
  end
end