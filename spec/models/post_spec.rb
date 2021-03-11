require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'it checks the model' do
    it 'checks if the post is valid' do
      user = User.create(name: 'test', email: 'test@test.com', password: '123456')

      post = user.posts.create(content: 'Testing the post model')
      expect(post).to be_valid
    end

    it 'check if the post belongs to the user' do
      post = Post.reflect_on_association(:user)
      expect(post.macro).to eql(:belongs_to)
    end
  end
end
