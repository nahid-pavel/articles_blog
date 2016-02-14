class User < ActiveRecord::Base
   
    has_many :articles

    before_save { self.email = email.downcase }

    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :username, presence: true, 
                         uniqueness:{case_sensitive: false },
                         length:{minimum: 4, maximum: 10}
    validates :email, presence: true, uniqueness: {case_sensitive: false }, format: {with:  VALID_EMAIL_REGEX  }

    

    validates :password, length:{minimum: 8, maximum: 20}

   





end
