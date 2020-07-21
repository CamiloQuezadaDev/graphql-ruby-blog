class Mutations::DeletePost < Mutations::BaseMutation
    description "Delete a Post"

    argument :id , ID, required: true 

    field :post, Types::PostType, null: true 
    field :deleted, Boolean, null: false
    field :errors, [String], null: false

    def resolve(args)
    
        post = Post.find(args[:id])

        if post.destroy 
            return {
                post: post,
                deleted: true,
                errors: post.errors.full_messages
            }
        else    
            raise ActiveRecord::RecordInvalid, post
        end


        rescue ActiveRecord::RecordNotFound  => e 
            return { errors: [e], deleted: false } 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, deleted: false }
    end

end