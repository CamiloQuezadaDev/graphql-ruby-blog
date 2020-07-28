module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :posts, [PostType], null: true 
    field :favorites, [PostType], null: true

    def favorites
      object.favorite_posts 
    end 
  end
end
