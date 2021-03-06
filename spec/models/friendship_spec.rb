require 'rails_helper'

RSpec.describe Friendship, :type => :model do
  context 'it checks the model' do
    it 'creates a friendship between two users' do
      user1 = User.create(id: 1, email: 'test@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      user2 = User.create(id: 2, email: 'test1@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test1', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      fs = Friendship.create(user_id: user1.id, friend_id: user2.id, status: false)
      expect(Friendship.find(fs.id)).to eql(Friendship.first)
    end

    it 'accepts a friendship' do
      user1 = User.create(id: 1, email: 'test@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      user2 = User.create(id: 2, email: 'test1@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test1', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      fs = Friendship.create(user_id: user1.id, friend_id: user2.id, status: false)

      fs.update(status: true)
      expect(Friendship.find(fs.id)).to eql(Friendship.first)
    end

    it 'rejects a friendship' do
      user1 = User.create(id: 1, email: 'test@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      user2 = User.create(id: 2, email: 'test1@test.com', password: '123456', created_at: Time.now,
                          updated_at: Time.now, name: 'Test1', gravatar_url: 'http://www.gravatar.com/avatar/%22')
      fs = Friendship.create(user_id: user1.id, friend_id: user2.id, status: false)

      expect(Friendship.destroy(Friendship.first.id)).to eql(fs)
    end
  end
  context 'it checks the assosiation' do
    it 'checks if the friendship belongs to the user' do
      friendship = Friendship.reflect_on_association(:user)
      expect(friendship.macro).to eql(:belongs_to)
    end

    it 'checks if the friendship belongs to the inverted user' do
      friendship = Friendship.reflect_on_association(:friend)
      expect(friendship.macro).to eql(:belongs_to)
    end
  end
end
