require_relative "../models/entry.rb"


class AddressBook
    attr_accessor :entries
    
    def initialize
        @entries = []
    end
    
    def add_entry(name, phone, email)
        # #7
        index = 0
        @entries.each do |entry|
            # #8
            if name < entry.name
                break
            end
            index += 1
        end
        # #9
        @entries.insert(index, Entry.new(name, phone, email))
    end
    
    def remove_entry(entry)
        
    end
    
    
    
end