module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn
    
    field :create_post, mutation: Mutations::CreatePost
    field :update_post, mutation: Mutations::UpdatePost
    field :delete_post, mutation: Mutations::DeletePost 

    field :add_comment, mutation: Mutations::AddComment 
    field :add_clap, mutation: Mutations::AddClap

    field :add_favorite, mutation: Mutations::AddFavorite 
    field :delete_favorite, mutation: Mutations::DeleteFavorite 
  end
end
