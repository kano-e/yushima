require 'rails_helper'

describe 'operation for game' do
  describe 'policyについて' do
    # テストの書き方に悩んで policy のテスト書いたけど、これは Game::Policy でテストすれば良いかな
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

  describe 'validationについて' do
    let(:user) { User.create(role: :admin, socialplus_uid: '12345') }

    it 'title_jaは必須' do
      expect do
        Game::Create.(current_user: user, game: { title_ja: '' })
      end.to raise_error(Trailblazer::Operation::InvalidContract)
    end

    it 'min_playersは数値のみ受け付ける' do
      expect do
        Game::Create.(current_user: user, game: { title_ja: 'テスト', min_players: 'two' })
      end.to raise_error(Trailblazer::Operation::InvalidContract)
    end

    it 'min_playersは1以上' do
      expect do
        Game::Create.(current_user: user, game: { title_ja: 'テスト', min_players: '0' })
      end.to raise_error(Trailblazer::Operation::InvalidContract)
    end

    it 'min_playersは99以下' do
      expect do
        Game::Create.(current_user: user, game: { title_ja: 'テスト', min_players: '100' })
      end.to raise_error(Trailblazer::Operation::InvalidContract)
    end
  end
end
