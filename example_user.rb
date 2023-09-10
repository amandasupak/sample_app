require "pry"
class User
    attr_accessor :firstname, :lastname, :email

    def initialize(attributes= {})
        @firstname = attributes[:firstname]
        @lastname = attributes[:lastname]
        @email = attributes[:email]
end
    def alphabetical_name
        @alphabetical_name = "#{@lastname}, #{firstname}" 
    end


    def formatted_email
        alphabetical_name #self.alphabetical_name is implied
        "#{alphabetical_name} <#{@email}>"
    end

end