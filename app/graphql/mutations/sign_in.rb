class Mutations::SignIn < Mutations::BaseMutation

  argument :email, String, required: true
  argument :password, String, required: true
  
  field :user, Types::UserType, null: true
  field :token, String, null: true
  field :success, Boolean, null: false
  field :errors, [String], null: true

  def resolve(args)

    user = User.find_by!(email: args[:email])

    if args[:password].empty?
      raise Exception, "Password can't be Blank."
    end

    unless user.authenticate(args[:password])
      raise Exception, "The submitted form contains errors please verify."
    end

    token = AuthToken.token_for_user(user)
    context[:session][:token] = token

    return {
      user: user,
      token: token,
      errors: user.errors.full_messages.presence,
      success: true
    }

    rescue ActiveRecord::RecordNotFound => e
      return { errors: ["The submitted form contains errors please verify."], success: false }

    rescue Exception => e
      { errors: e.message.split(",") ,success: false }
  end
end