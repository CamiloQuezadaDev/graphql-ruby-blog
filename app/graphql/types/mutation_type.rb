module Types
  class MutationType < Types::BaseObject
    
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
  end
end
