# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(email: 'user@example.com', password: 'password') }

  context 'validações' do
    it 'é válido com texto e tags válidos' do
      post = user.posts.new(text: 'Conteúdo do post', tag: 'tag1')
      expect(post).to be_valid
    end

    it 'é inválido sem texto' do
      post = user.posts.new(tag: 'tag1')
      expect(post).to_not be_valid
    end
  end
end
