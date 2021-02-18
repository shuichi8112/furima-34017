require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 1
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '2223456'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include( "Postal code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空だと保存できないこと' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @order_address.phone_number = '0901111222233'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが英字だと保存できないこと' do
      @order_address.phone_number = 'aaaaaaaa'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end

    it 'phone_numberが全角だと保存できないこと' do
      @order_address.phone_number = 'あああああああ'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end

  end
end
