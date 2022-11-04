module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :content, String, null: true
    field :slug, String, null: true
    field :state, String, null: true
    field :posted_at, GraphQL::Types::ISO8601Date, null: true 
    field :updated_at, GraphQL::Types::ISO8601Date, null: true 
    field :posted_by, UserType, null: true, method: :user
    field :comment_count, Integer, null: true 
    field :clap_count, Integer, null: true
    field :comments, [CommentType], null: true
    field :claps, [ClapType], null: true 
  end
end
