# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password') }
  let(:post) { Post.create(text: 'Conteúdo do post', user: user) }

  context 'validações' do
    it 'é válido com texto válido' do
      comment = post.comments.new(text: 'Comentário interessante')
      expect(comment).to be_valid
    end

    it 'é inválido sem texto' do
      comment = post.comments.new
      expect(comment).to_not be_valid
    end
  end
end
