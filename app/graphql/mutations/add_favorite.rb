class Mutations::AddFavorite < Mutations::BaseMutation 
    description "Add post to favorite"

    argument :postId, ID, required: true 

    field :favorite, Types::PostType, null: true 
    field :success, Boolean, null: false
    field :errors, [String], null: false 

    def resolve(args)
        
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end

        post = Post.find(args[:post_id])

        if context[:current_user] == post.user 
            raise Exception, "You can't add to favorite your own post"
        end

        if Favorite.exists?(user: context[:current_user], post: post) 
            raise Exception, "you have added this post in favorites"
        end 

        favorite = Favorite.new( 
            post: post,
            user: context[:current_user]
        )

        if favorite.save
            return {
                favorite: post,
                success: true, 
                errors: favorite.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, favorite
        end 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, success: false }

        rescue Exception => e
            { errors: e.message.split(",") , success: false}
    end
end