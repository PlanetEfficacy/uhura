module Contactable
  def name
    "#{first_name} #{last_name}"
  end

  def phone_number
    primary_contact.phone_number
  end

  def phone_number=(new_number)
    primary_contact.update(phone_number: new_number)
  end

  def language
    Languages.find(language_code)
  end

  def primary_contact
    contacts.find_by(default: true) || Contact.create(contactable: self)
  end

  def self.update(params)
    params[:contactable].update(params[:contactable_params])
    params[:contactable].phone_number = params[:phone_number]
  end

end
