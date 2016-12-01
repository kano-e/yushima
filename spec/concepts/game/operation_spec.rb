require 'rails_helper'

describe 'operation for game' do
  describe 'policyについて' do
    context 'adminユーザの場合' do
      let(:user) { User.create(role: :admin, socialplus_uid: '12345') }

      it 'Gameが作成できる' do
        expect do
          Game::Create.(current_user: user, game: { title_ja: 'テスト' })
        end.to change(Game, :count).by(1)
      end
    end

    context 'memberユーザなら' do
      let(:user) { User.create(role: :member, socialplus_uid: '12345') }

      it 'Gameが作成できる' do
        expect do
          Game::Create.(current_user: user, game: { title_ja: 'テスト' })
        end.to change(Game, :count).by(1)
      end
    end

    context 'adminでもmemberでもないなら' do
      let(:user) { User.create(role: :user, socialplus_uid: '12345') }

      it 'NotAuthorizedになる' do
        expect do
          Game::Create.(current_user: user, game: { title_ja: 'テスト' })
        end.to raise_error(Trailblazer::NotAuthorizedError)
      end
    end
  end
end
