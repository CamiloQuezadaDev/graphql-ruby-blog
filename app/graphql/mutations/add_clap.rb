class Mutations::AddClap < Mutations::BaseMutation 
    description "Add clap to post"

    argument :postId, ID, required: true 

    field :clap, Types::ClapType, null: true 
    field :success, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)
        
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end

        post = Post.find(args[:post_id])

        if context[:current_user] == post.user 
            raise Exception, "You can't clap your own post"
        end


        clap = Clap.new( 
            post: post,
            user: context[:current_user]
        )

        if clap.save
            return {
                clap: clap,
                success: true, 
                errors: clap.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, clap
        end 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e
            { errors: e.message.split(",") , success: false}
    end
end