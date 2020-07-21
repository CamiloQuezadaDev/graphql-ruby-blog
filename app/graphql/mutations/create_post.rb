class Mutations::CreatePost < Mutations::BaseMutation 
    description "Create a new Post"

    argument :title, String, required: true 
    argument :body, String, required: true 

    field :post, Types::PostType, null: true 
    field :success, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)

        post = Post.new(args)

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
    end
end