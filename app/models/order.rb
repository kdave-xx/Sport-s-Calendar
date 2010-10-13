class Order < ActiveRecord::Base
  belongs_to :calendar
  attr_accessor :card_number, :card_verification
  
  has_one :address
#  accepts_nested_attributes_for :address, :allow_destroy => true
  has_many :transactions, :class_name => "OrederTransaction"

  validates_presence_of :fname, :lname, :email
 
  validate_on_create :validate_card

  def fullname
    "#{fname} #{lname}"
  end

  def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, :ip => ip_address)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end

  def price_in_cents
    (total_price.to_f*100).round
  end

  private

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.try(:month),
      :year               => card_expires_on.try(:year),
      :first_name         => fname,
      :last_name          => lname
    )
  end
end
