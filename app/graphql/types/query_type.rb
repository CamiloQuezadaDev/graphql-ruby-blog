module Types
  class QueryType < Types::BaseObject

    field :current_user, UserType, null: true 

    def current_user
      context[:current_user]
    end
    
    field :all_posts, [PostType], null: true 

    def all_posts
      Post.all 
    end

    field :post, PostType, null: true do  
      argument :id, ID, required: true 
    end
  
    def post(id:)
      Post.find(id)
      rescue ActiveRecord::RecordNotFound
        return nil
    end

  end
end
