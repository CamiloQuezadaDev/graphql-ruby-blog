module Types
  class QueryType < Types::BaseObject
    
    field :all_posts, [PostType], null: true 

    def all_posts
      Post.all 
    end

    field :post, PostType, null: true do  
      argument :id, ID, required: true 
    end
    
    def user(id:)
      if context[:current_user] && context[:current_user].admin?
        User.find_by(id: id, company_id: context[:current_company].id)
      end
      rescue ActiveRecord::RecordNotFound 
        return nil
    end

    def post(id:)
      Post.find(id)
      rescue ActiveRecord::RecordNotFound
        return nil
    end
    
  end
end
