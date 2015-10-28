require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'email cannot be nil' do
      subject.email = nil

      subject.valid?

      expect(subject.errors.messages[:email]).to include "can't be blank"
    end

    it 'password cannot be nil' do
      subject.password = nil

      subject.valid?

      expect(subject.errors.messages[:password]).to include "can't be blank"
    end
  end

  it 'return user email as to_s' do
    subject.email = 'user@domain.com'

    expect(subject.to_s).to eq 'user@domain.com'
  end
end
