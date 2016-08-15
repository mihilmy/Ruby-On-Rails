class User < ActiveRecord::Base
    # Defines the relationships between other models
    # has_one use a singular model names, while has_many uses a plural reference
    has_one :profile, dependent: :destroy
    has_many :todo_lists, dependent: :destroy
    has_many :todo_items, through: :todo_lists, source: :todo_items
    # Checks that the username is present when entering data into the DB
    validates :username, presence: true
    
    # Encrypts the passwod when stored in the DB
    has_secure_password 
    
    def get_completed_count
        todo_items.where(completed: true).count
    end
end
