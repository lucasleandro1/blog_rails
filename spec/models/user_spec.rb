require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validações' do
    it 'é válido com atributos válidos' do
      user = User.new(email: 'usuario@example.com', password: 'senha123')
      expect(user).to be_valid
    end

    it 'é inválido sem um email' do
      user = User.new(password: 'senha123')
      expect(user).to_not be_valid
    end

    it 'é inválido sem uma senha' do
      user = User.new(email: 'usuario@example.com')
      expect(user).to_not be_valid
    end
  end

  context 'métodos de classe' do
    describe '.find_by_email' do
      it 'encontra um usuário pelo email' do
        user = User.create(email: 'usuario@example.com', password: 'senha123')
        found_user = User.find_by_email('usuario@example.com')
        expect(found_user).to eq(user)
      end

      it 'retorna nil se o usuário não existir' do
        found_user = User.find_by_email('naoexistente@example.com')
        expect(found_user).to be_nil
      end
    end
  end
end
