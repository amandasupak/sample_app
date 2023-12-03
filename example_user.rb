require "pry"
class User
    attr_accessor :firstname, :lastname, :email, :full_name

    def initialize(attributes= {})
        @firstname = attributes[:firstname]
        @lastname = attributes[:lastname]
        @email = attributes[:email]
end
    def alphabetical_name
        @alphabetical_name = "#{@lastname}, #{firstname}" 
    end

    def full_name
        #@full_name = at the start is implied
        "#{@firstname} #{@lastname}" 
    end

    def formatted_email
        # these top two white lines calls the method
        # full_name and alphabetical_name
        full_name
        alphabetical_name #self.alphabetical_name is implied
        puts "full name: #{@full_name} <#{@email}>"
        puts "alphabetical name: #{alphabetical_name} <#{@email}>"
    end

end