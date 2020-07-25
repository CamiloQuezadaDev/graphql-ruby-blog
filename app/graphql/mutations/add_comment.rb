class Mutations::AddComment < Mutations::BaseMutation 
    description "Add Comment to post"

    argument :postId, ID, required: true 
    argument :content, String, required: true 


    field :comment, Types::CommentType, null: true 
    field :success, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end

        post = Post.find(args[:post_id])


        comment = Comment.new(
            content: args[:content],
            post: post,
            user: context[:current_user]
        )

        if comment.save
            return {
                comment: comment,
                success: true, 
                errors: comment.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, comment
        end 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e
            { errors: e.message.split(",") , success: false}
    end
end