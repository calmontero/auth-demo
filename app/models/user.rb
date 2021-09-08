class User < ApplicationRecord
    def password=(new_password)
        salt = BCrypt::Engine.generate_salt
        self.password_digest = BCrypt::Engine.hash_secret(new_password, salt)
    end

    {
        "username": "calmontero"
        "password": "password"        
    }

    def authenticate(user_password)
        salt = self.password_digest[0..28]
        hashed_value = BCrypt::Engine.hash_secret(user_password, salt)

        if hashed_value == self.password_digest
            return self
        else
            nil
        end

    end
end
