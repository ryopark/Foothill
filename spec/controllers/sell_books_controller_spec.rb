require 'rails_helper'

RSpec.describe SellBooksController do
  let(:sell_book) { FactoryGirl.create(:sell_book, user: current_user) }
  let(:current_user) { FactoryGirl.create(:user) }

  describe 'GET show' do
    it 'assigns instance variable' do
      get :show, id: sell_book.id
      expect(assigns(:book)).to eq sell_book
    end
  end

  describe 'GET new' do
    context 'when current_user is login user' do
      before { login_user current_user }

      it 'assigns instance variable' do
        get :new
        expect(assigns(:book)).to be_a_new(SellBook)
      end
    end
  end

  describe 'POST create' do
    let(:valid_attr) { { name: 'Japanese', class_name: 'abc', prof_name: 'michael', price: 100_00, deanza_flag: true, foothill_flag: true } }

    context 'when current_user is login user' do
      before { login_user current_user }

      context 'with valid attributes' do
        it 'saves new sell_book in database' do
          expect { post :create, sell_book: valid_attr }.to change(SellBook, :count).by(1)
        end

        it 'rediects to sell book path' do
          post :create, sell_book: valid_attr
          expect(response).to redirect_to(assigns(:book))
        end
      end

      context 'with invalid attributes' do
        let(:invalid_attr) { { name: nil, price: 'abac' } }

        it 'does not save new sell_book in database' do
          expect { post :create, sell_book: invalid_attr }.not_to change(SellBook, :count)
        end

        it 're-renders new template' do
          post :create, sell_book: invalid_attr
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
