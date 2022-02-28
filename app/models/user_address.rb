class UserAddress
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :email, :password, :password_confirmation, :first_name, :last_name, :kana_first_name, :kana_last_name, :gender, :telephone_number, :birthday, :postal_code, :area, :municipality, :street_number, :building_name, :service_delivery
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :email
    validates :password, format: { with: PASSWORD_REGEX }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :kana_first_name, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :kana_last_name, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角で入力してください', allow_blank: true}
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'を正しい値で入力してください', allow_blank: true}
    validates :birthday
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めた正しい値で入力してください"}
    validates :municipality
    validates :street_number
    validates :gender, numericality: { other_than: 0, messege: "を選択してください" }
    validates :area, numericality: { other_than: 0, messege: "を選択してください" }
  end

  
  
  def save
     user = User.create(email: email, password: password, first_name: first_name, last_name: last_name, kana_first_name: kana_first_name, kana_last_name: kana_last_name, gender: gender.to_i, telephone_number: telephone_number, birthday: birthday )
     Address.create(postal_code: postal_code, area: area.to_i, municipality: municipality, street_number: street_number, building_name: building_name, user_id: user.id)
   end 

end
