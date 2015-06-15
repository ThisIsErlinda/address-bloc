require_relative '../models/address_book.rb'

RSpec.describe AddressBook do 
  #instantiate Address_book once in one place as :book (DRY)
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name #checks all of these? 
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  context "attributes" do 
    it "should respond to entries" do 
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end
 
    it "should initialize entries as empty" do
      expect(book.entries.size).to eq 0
    end
  end

  context ".add_entry" do
     it "adds only one entry to the address book" do     
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(book.entries.size).to eq 1
     end
 
     it "adds the correct information to entries" do    
       book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       new_entry = book.entries[0]
 
       expect(new_entry.name).to eq 'Ada Lovelace'
       expect(new_entry.phone_number).to eq '010.012.1815'
       expect(new_entry.email).to eq 'augusta.king@lovelace.com'
     end
   end
   #Bloc Checkpoint assignment begins here
  context ".remove_entry" do 
    it "removes entry from the address book" do 
      #create a mock address book w/ one entry    
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      #write a routine to show that remove(entry) decreases the no. of entries
      before_removal_count =  book.entries.size
      entry = book.entries[0]
      book.remove_entry(entry)
      expect(book.entries.size).to eq before_removal_count-1
    end
  end

  context ".import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      #check the size of the entries in AddressBook
      expect(book_size).to eq 5
    end
 it "imports the 1st entry" do
       book.import_from_csv("entries.csv")
       # Check the first entry
       entry_one = book.entries[0]
       expect(entry_one.name).to eql "Bill"
       expect(entry_one.phone_number).to eql "555-555-5555"
       expect(entry_one.email).to eql "bill@blocmail.com"
     end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       expect(entry_two.name).to eql "Bob"
       expect(entry_two.phone_number).to eql "555-555-5555"
       expect(entry_two.email).to eql "bob@blocmail.com"
     end
 
     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       expect(entry_three.name).to eql "Joe"
       expect(entry_three.phone_number).to eql "555-555-5555"
       expect(entry_three.email).to eql "joe@blocmail.com"
     end
 
     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       expect(entry_four.name).to eql  "Sally"
       expect(entry_four.phone_number).to eql "555-555-5555"
       expect(entry_four.email).to eql "sally@blocmail.com"
     end
 
     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       expect(entry_five.name).to eql "Sussie"
       expect(entry_five.phone_number).to eql "555-555-5555"
       expect(entry_five.email).to eql "sussie@blocmail.com"
     end
   end

  context ".binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect entry.instance_of?(Entry) #are there some optional parentheses here?
      check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
    end

    it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect entry.instance_of?(Entry) 
      check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect entry.instance_of?(Entry) 
      check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect entry.instance_of?(Entry) 
      check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sussie")
      expect entry.instance_of?(Entry) 
      check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
    end

    it "searches AddressBook for Billy" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Billy")
      expect(entry).to be_nil
    end
  end
end