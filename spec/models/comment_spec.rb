require 'rails_helper'

RSpec.describe Comment, :type => :model do
  context 'it checks the model' do
    it 'checks if the comment belongs to the user' do
      comment = Comment.reflect_on_association(:user)
      expect(comment.macro).to eql(:belongs_to)
    end

    it 'checks if the comment belongs to the post' do
      comment = Comment.reflect_on_association(:user)
      expect(comment.macro).to eql(:belongs_to)
    end
  end
end
