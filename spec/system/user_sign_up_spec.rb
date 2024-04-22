require 'rails_helper'

describe 'User sign in' do
  it 'in root_path' do
    visit root_path
    click_on 'Entrar'

    expect(current_path).to eq new_user_session_path
  end
end