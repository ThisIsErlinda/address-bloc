require_relative 'entry.rb'
require 'csv'

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone, email)
    index = 0
      @entries.each do |entry|
        if name < entry.name
          break
        end
        index += 1
      end
      @entries.insert(index, Entry.new(name, phone, email))
  end
  
   def remove_entry(entry)
    @entries.delete(entry)
  end

  def binary_search(name)
    # #1
     lower = 0
     upper = entries.length - 1

 # #2
     while lower <= upper
 # #3
       mid = (lower + upper) / 2
       mid_name = entries[mid].name
 
 # #4
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
         return nil
  end

  def search(name)
    # Maybe we have more than one implementation of search? 
    return binary_search(name)
  end

   def import_from_csv(filename)
    csv_text = File.read(filename)
    csv = CSV.parse(csv_text, headers: true)

    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
    return csv.count
  end
end