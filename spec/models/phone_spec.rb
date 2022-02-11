require 'rails_helper'

RSpec.describe Phone, type: :model do

  subject {
    user = User.create( name: 'Jess', age: 29, bio: 'Love giraffes!' )
    user.contacts.create( name: 'Sarah', birthday: 1992-10-15 )
  }

  context 'is valid' do
    it 'is valid with valid attributes' do
      num = subject.phones.create( number: '94800-6262', number_type: 'cellphone', main_number: true)
      expect(num).to be_valid
    end
  
    it 'is valid when two numbers have the same number type' do
      num = subject.phones.create( number: '94800-6262', number_type: 'cellphone', main_number: true)
      num2 = subject.phones.create( number: '96421-0740', number_type: 'cellphone', main_number: false)
      expect(num2).to be_valid
    end
  end

  context 'is not valid' do
    it 'is not valid when number is duplicated' do
      num = subject.phones.create( number: '94800-6262', number_type: 'cellphone', main_number: true)
      num2 = subject.phones.create( number: '94800-6262', number_type: 'home', main_number: false)
      expect(num2.errors.count).to eq(1)
    end
  
    it 'is not valid when two numbers are marked as main' do
      num = subject.phones.create( number: '94800-6262', number_type: 'cellphone', main_number: true)
      num2 = subject.phones.create( number: '3642-2242', number_type: 'home', main_number: true)
      expect(num2.errors.count).to eq(1)
    end
  end

end
