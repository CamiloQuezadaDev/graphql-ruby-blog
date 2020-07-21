module Types
  class QueryType < Types::BaseObject
    
    field :all_posts, [PostType], null: true 

    def all_posts
      Post.all 
    end
  end
end
