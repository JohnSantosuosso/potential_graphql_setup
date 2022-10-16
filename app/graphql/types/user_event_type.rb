# frozen_string_literal: true

module Types
  class UserEventType < Types::BaseObject
    field :id, ID, null: false
    field :event_id, Integer
    field :user_id, Integer
  end
end
