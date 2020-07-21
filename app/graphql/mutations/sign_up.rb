class Mutations::SignUp < Mutations::BaseMutation 
    description "Create a new account"

    argument :name, String, required: true 
    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :user, Types::UserType, null: true 
    field :success, Boolean, null: true 
    field :errors, [String], null: false 

    def resolve(name: nil, credentials: nil)

        user = User.new(
            name: name, 
            email: credentials[:email],
            password: credentials[:password]
        )

        if user.save 
            return {
                user: user,
                success: true, 
                errors: user.errors.full_messages
            }
        else 
            raise ActiveRecord::RecordInvalid, user
        end

        rescue ActiveRecord::RecordInvalid => invalid 
            return { errors: invalid.record.errors.full_messages, success: false }
    end
end