require 'rails_helper'

RSpec.describe SellBookCommentsController do
  let(:current_user) { FactoryGirl.create(:user) }

  describe 'GET new' do
    context 'when current_user is login_user' do
      before { login_user current_user }

      it 'assigns instance variable' do
        get :new
        expect(assigns(:sell_book_comment)).to be_a_new(SellBookComment)
      end
    end

    context 'when current_user is not login_user' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'POST create' do
    let(:sell_book) { FactoryGirl.create(:sell_book, user: current_user) }

    context 'current_user is login user' do
      before { login_user current_user }

      context 'with valid params' do
        let(:params) { { body: 'あいうえお', user_id: current_user.id } }

        it 'assigns instance variable' do
          post :create, sell_book_comment: params, sell_book_id: sell_book.id
          expect(assigns(:sell_book)).to eq sell_book
        end

        it 'saves new sell_book_comment in the database' do
          expect { post :create, sell_book_comment: params, sell_book_id: sell_book.id }.to change(SellBookComment, :count).by(1)
        end

        it 'redirects to sell_book page' do
          post :create, sell_book_comment: params, sell_book_id: sell_book.id
          expect(response).to redirect_to(assigns(:sell_book))
        end
      end

      context 'with invalid params' do
        let(:valid_params) { { body: nil } }

        it 'assigns instance variable' do
          post :create, sell_book_comment: valid_params, sell_book_id: sell_book.id
          expect(response).to render_template(:new)
        end
      end
    end

    context 'current_user is not login user' do
      let(:params) { { body: 'あいうえお', user_id: current_user.id } }

      it 'redirects to login page' do
        post :create, sell_book_comment: params, sell_book_id: sell_book.id
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end
end
