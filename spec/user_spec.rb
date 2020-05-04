require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'emilyjane', email: 'emily@example.com', password: '12345')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'emily@example.com'
      expect(user.username).to eq 'emilyjane'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('12345')
      User.create(username: 'emilyjane', email: 'emily@example.com', password: '12345')
    end
  end

  describe '.find_by_id' do
    it 'finds the user by their id' do
      user = User.create(username: 'emilyjane', email: 'emily@example.com', password: '12345')
      result = User.find_by_id(id: user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if no id is provided' do
      expect(User.find_by_id(id: nil)).to eq nil
    end
  end
end