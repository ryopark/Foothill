require 'rails_helper'

RSpec.describe MessagesController do
  describe 'POST create' do
    let(:message_group) { MessageGroup.create(buyer_id: buyer.id, seller_id: seller.id, sell_book: sell_book) }
    let(:sell_book) { FactoryGirl.create(:sell_book, user: seller) }
    let(:buyer) { FactoryGirl.create(:user) }
    let(:seller) { FactoryGirl.create(:user) }

    context 'when current_user is login user' do
      before { login_user buyer }

      context 'with valid params' do
        let(:valid_params) { { body: 'abcde' } }

        it 'assigns instance variable' do
          post :create, message: valid_params, message_group_id: message_group.id
          expect(assigns(:message_group)).to eq message_group
        end

        it 'saves new message in database' do
          expect { post :create, message: valid_params, message_group_id: message_group.id }.to change(Message, :count).by(1)
        end

        it 'redirects to same page' do
          post :create, message: valid_params, message_group_id: message_group.id
          expect(response).to redirect_to(assigns(:message_group))
        end
      end

      context 'with invalid params' do
        let(:invalid_params) { { body: nil } }

        it 'redirects message group page' do
          post :create, message: invalid_params, message_group_id: message_group.id
          expect(response).to redirect_to(assigns(:message_group))
        end
      end
    end

    context 'when current_user is not login user' do
      let(:params) { { body: 'abcde' } }

      it 'redirects to login page' do
        post :create, message: params, message_group_id: message_group.id
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end
end
