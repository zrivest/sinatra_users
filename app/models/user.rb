class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = User.find_by_email(email)

    if user != nil
      if user.password == password
        # session[:user_id] = @user.id 
        return user
      else 
        false
      end
    else 
      false   
    end
  end
end
