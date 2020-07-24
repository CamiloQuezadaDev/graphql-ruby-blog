class Mutations::DeletePost < Mutations::BaseMutation
    description "Delete a Post"

    argument :id , ID, required: true 

    field :post, Types::PostType, null: true 
    field :deleted, Boolean, null: false
    field :errors, [String], null: false

    def resolve(args)
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end
    
        post = Post.find(args[:id])

        unless context[:current_user] == post.user 
            raise Exception, "You do not have permission"
        end

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

        rescue Exception => e
            { errors: e.message.split(",") , deleted: false}
    end

end