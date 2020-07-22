class Mutations::SignIn < Mutations::BaseMutation

    argument :credentials, Types::AuthProviderCredentialsInput, required: true

    field :user, Types::UserType, null: true 
    field :token, String, null: true 
    field :errors, [String], null:true 

    def resolve(credentials: nil)
        
        return unless credentials 

        user = User.find_by(email: credentials[:email])

        result = {} 

        unless user.present? 
            result[:errors] = ["User doesn't found. Check email address"]
            return result
        end

        unless credentials[:password].present?
            result[:errors] = ["Password required"]
            return result 
        end

        unless user.authenticate(credentials[:password])
            result[:errors] = ["Wrong Password"]
            return result 
        end

        token = AuthToken.token_for_user(user)

        context[:session][:token] = token 

        result = { user: user, token: token, errors: [] }
    end
end