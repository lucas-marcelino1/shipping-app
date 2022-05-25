class CarrierUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_carrier
  belongs_to :carrier
  
  private

  def set_carrier
    @user_email_domain = self.email.match(/(?<=@)(\S+)/).to_s
    @carrier = Carrier.where(email_domain: @user_email_domain).first
    if @carrier == nil
      self.errors.add(:carrier, 'deve ter domínio de e-mail cadastrado')
    else 
      self.carrier = @carrier
    end
  end

end
