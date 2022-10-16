module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    
    field :get_users, [Types::UserType], null: false, description: 'Returns a list of users'
    
    field :get_user, Types::UserType, null: false, description: 'Returns a single user by id' do
      argument :id, ID, required: true
    end

    field :get_user_events, [Types::UserEventType], null: false, description: 'Returns all user events'

    def get_user(id:)
      User.find(id)
    end

    def get_users
      User.all
    end

    def get_user_events(id:)
      UserEvent.where('user_id = ?, id')
    end
  end
end
