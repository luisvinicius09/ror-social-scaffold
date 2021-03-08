require 'rails_helper'

Rspec.describe Friendship, :type => :model do
  context 'it checks the model' do
    it 'creates a friendship between two users' do
      user1 = User.create!(id: 1, email: 'test@test.com', password: '123456', created_at: Time.now,
                       updated_at: Time.now, name: 'Test', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      user2 = User.create!(id: 2, email: 'test1@test.com', password: '123456', created_at: Time.now,
                       updated_at: Time.now, name: 'Test1', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      fs = Friendship.create(user_id: user1.id, friend_id: user2.id, status: false)
      expect(Friendship.find(fs.id)).to eql(Friendship.last.id)
    end

    it 'accepts a friendship' do
    end

    it 'rejects a friendship' do
    end
  end
  
end