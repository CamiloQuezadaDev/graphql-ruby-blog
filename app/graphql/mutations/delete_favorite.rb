class Mutations::DeleteFavorite < Mutations::BaseMutation
    description "Delete post from favorite"

    argument :postId , ID, required: true 

    field :favorite, Types::PostType, null: true 
    field :deleted, Boolean, null: false
    field :errors, [String], null: false

    def resolve(args)
        unless context[:current_user]
            raise Exception, "Sign in to do this action"
        end
    
        post = Post.find(args[:post_id])

        current_user = context[:current_user]

        favorite = Favorite.find_by!(user: current_user, post: post)

        
        if favorite.destroy 
            return {
                favorite: post,
                deleted: true,
                errors: favorite.errors.full_messages
            }
        else    
            raise ActiveRecord::RecordInvalid, favorite 
        end


        rescue ActiveRecord::RecordNotFound  => e 
            return { errors: [e], deleted: false } 

        rescue ActiveRecord::RecordInvalid => invalid
            return { errors: invalid.record.errors.full_messages, deleted: false }

        rescue Exception => e
            { errors: e.message.split(",") , deleted: false}
    end

end