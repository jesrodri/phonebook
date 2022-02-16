require 'rails_helper'

RSpec.describe Contact, :type => :model do
  fixtures :users

    subject (:user) { users(:user1) }

    it 'is valid with valid attributes' do
      subject
      contact = subject.contacts.create( name: 'Jess', birthday: 1992-11-9 )
      expect(contact).to be_valid
    end

    it 'is not valid with a duplicated name' do
      subject
      contact2 = subject.contacts.create( name: 'John', birthday: 1994-1-5 )
      contact3 = subject.contacts.create( name: 'John', birthday: 1993-4-30 )
      expect(contact3.errors.count).to eq(1)
    end

end
