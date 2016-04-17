require 'rails_helper'

RSpec.describe MessageGroupsController do
  let(:message_group) { MessageGroup.create(buyer_id: buyer.id, seller_id: seller.id, sell_book: sell_book) }
  let(:sell_book) { FactoryGirl.create(:sell_book, user: seller) }
  let(:buyer) { FactoryGirl.create(:user) }
  let(:seller) { FactoryGirl.create(:user) }

  describe 'GET show' do
    context 'when buyer is login user' do
      before { login_user buyer }

      it 'assigns instance variables' do
        get :show, id: message_group.id
        expect(assigns(:message_group)).to eq message_group
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

    context 'when current_user is not login user' do
      it 'redirects to login page' do
        get :show, id: message_group.id
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'POST create' do
    context 'when buyer is login user' do
      before { login_user buyer }

      it 'saves new message_group in the database' do
        expect { post :create, sell_book_id: sell_book.id }.to change(MessageGroup, :count).by(1)
      end

      it 'redirects to message_group' do
        post :create, sell_book_id: sell_book.id
        expect(response).to redirect_to(assigns(:message_group))
      end
    end

    context 'when buyer is not login user' do
      it 'rediects to login page' do
        post :create, sell_book_id: sell_book.id
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end
end
