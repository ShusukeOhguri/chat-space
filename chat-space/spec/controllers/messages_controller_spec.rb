require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user)          {create(:user)}

  describe 'ログインしていない場合' do
    it "意図したビューにリダイレクトできているか" do
      group = user.groups.first
      get :index, params:{group_id: group.id}
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe 'ログインしている場合' do
    before do
      login_user user
    end

    describe 'messages#index' do
      it "アクション内で定義しているインスタンス変数があるか" do
        group = user.groups.first
        get :index, params:{group_id: group.id}
  
        fake_groups = user.groups
        expect(assigns(:groups)).to eq fake_groups
  
        group_members_F = fake_groups.find(group.id).users
        expect(assigns(:group_members)).to eq group_members_F
  
        group_messages_F = fake_groups.find(group.id).messages
        expect(assigns(:group_messages)).to eq group_messages_F
  
        expect(assigns(:message)).to be_an_instance_of Message
      end

      it "該当するビューが描画されているか" do
        group = user.groups.first
        get :index, params:{group_id: group.id}
        expect(response).to render_template :index
      end
    end
  
    describe 'messages#create' do
      describe '保存に成功した場合' do
        it "メッセージの保存は行われたか" do
          group = user.groups.first
          post :create, params:{group_id: group.id, message: attributes_for(:message)}
          expect(assigns(:message).save).to be_truthy 
        end
    
        it "メッセージの保存画面に遷移しているか" do
          group = user.groups.first
          get :index, params:{group_id: group.id}
          expect(response).to render_template :index
        end
      end
  
      describe '保存に失敗した場合' do
        it "メッセージの保存は行われなかったか" do
          group = user.groups.first
          new_message = attributes_for(:message)
          new_message[:text] = nil
          new_message[:image] = nil
          post :create, params:{group_id: group.id, message: new_message}
          expect(assigns(:message).save).to be_falsey
        end
    
        it "意図したビューが描画されているか" do
          group = user.groups.first
          get :index, params:{group_id: group.id}
          expect(response).to render_template :index
        end
      end
    end
  end
end
