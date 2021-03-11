require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'it checks the model' do
    it 'checks if it belongs to the user' do
      like = Like.reflect_on_association(:user)
      expect(like.macro).to eql(:belongs_to)
    end

    it 'checks if it belongs to the post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eql(:belongs_to)
    end
  end
end
