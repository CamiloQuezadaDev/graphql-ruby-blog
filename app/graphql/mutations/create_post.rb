class Mutations::CreatePost < Mutations::BaseMutation 
    description "Create a new Post"

    argument :title, String, required: true 
    argument :body, String, required: true 

    field :post, Types::PostType, null: true 
    field :success, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end

        post = Post.new(
            title: args[:title],
            body: args[:body],
            user: context[:current_user]
        )

        if post.save
            return {
                post: post,
                success: true, 
                errors: post.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, post
        end 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e
            { errors: e.message.split(",") , success: false}
    end
end