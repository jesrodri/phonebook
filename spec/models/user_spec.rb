require 'rails_helper'

RSpec.describe User, :type => :model do
  
  subject {
    User.create( name: 'Sarah', age: 29, bio: 'Love cats and photography.')
  }

  context 'check username' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      user = User.create( age: 27, bio: 'Misterious...' )
      expect(user.errors.count).to eq(1)
    end

    it 'is not valid with a duplicated name' do
      subject
      user2 = User.create( name: 'Sarah', age: 32, bio: 'Love giraffes!' )
      expect(user2.errors.count).to eq(1)
    end
  end

  context 'check other attributes' do
    it 'is not valid when age is not an integer' do
      user3 = User.create( name: 'Jess', age: 'twenty-nine', bio: 'Love dogs and beaches.' )
      expect(user3.errors.count).to eq(1)
    end

    it 'is valid without an age' do
      user4 = User.create( name: 'Anna', bio: 'Dont reveal my age!' )
      expect(user4).to be_valid
    end

    it 'is valid without a bio' do
      user5 = User.create( name: 'George', age: 25 )
      expect(user5).to be_valid
    end
  end

end
