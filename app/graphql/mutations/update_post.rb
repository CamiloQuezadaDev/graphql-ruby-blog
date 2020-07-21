class Mutations::UpdatePost < Mutations::BaseMutation 
    description "Update a new Post"
    argument :id, ID, required: true 
    argument :title, String, required: false
    argument :body, String, required: false

    field :post, Types::PostType, null: true 
    field :updated, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)

        post = Post.find(args[:id])

        
        if post.update(args)
            return {
                post: post,
                updated: true, 
                errors: post.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, post
        end 


        rescue ActiveRecord::RecordNotFound  => e 
            return { errors: [e], updated: false } 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, updated: false }
    end
end