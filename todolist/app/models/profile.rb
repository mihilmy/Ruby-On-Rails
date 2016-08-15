class Profile < ActiveRecord::Base
    belongs_to :user
    validate :names, :male_name
    validates :gender,inclusion: { in: ["male", "female"] } 
    
    # custome validators are declared as symbols above and they print the errors
    # if encountered during the insertion process.
    def names
        if first_name.nil? && last_name.nil?
            errors.add(:first_name,"First name should not be left empty")
            errors.add(:last_name, "Last name should not be left empty")
        end
    end
    
    def male_name
        if gender == "male" && first_name == "Sue"
            errors.add(:first_name, "Please use a male name")
        end
    end   
    # class method to find the ages of all profiles between a certain range
    def self.get_all_profiles(min, max)
        Profile.where("birth_year BETWEEN ? AND ?", min, max).order( "birth_year ASC")
    end
end
