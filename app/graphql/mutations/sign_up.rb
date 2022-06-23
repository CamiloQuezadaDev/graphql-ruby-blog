class Mutations::SignUp < Mutations::BaseMutation 
  description "Create a new account"

  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true 
  field :success, Boolean, null: true 
  field :errors, [String], null: false 

  def resolve(args)
    user = User.new(args)
    
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