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
end
