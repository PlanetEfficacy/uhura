module Contactable
  def name
    "#{first_name} #{last_name}"
  end

  def phone_number
    primary_contact.phone_number
  end

  def language
    Languages.find(language_code)
  end

  def primary_contact
    contacts.find_by(default: true) || Contact.new
  end

end
