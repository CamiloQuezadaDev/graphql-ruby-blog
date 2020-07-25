module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :commented_at, GraphQL::Types::ISO8601Date, null: true 
    field :commented_by, UserType, null: true, method: :user

    def commented_at
      object.created_at
    end
  end
end
