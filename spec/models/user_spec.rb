require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(name: 'Hanna', email: 'hannania002@mail.com', password: '123456')
  end

  before { subject.save }

  it 'should have name Hanna' do
    expect(subject.name).to eql('Hanna')
  end

  it 'should have email present' do
    expect(subject.email).to eql('hannania002@mail.com')
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
