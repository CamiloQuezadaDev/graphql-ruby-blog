module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String, null: true
    field :created_at, GraphQL::Types::ISO8601Date, null: true 
    field :updated_at, GraphQL::Types::ISO8601Date, null: true 
    field :posted_by, UserType, null: true, method: :user
  end
end
