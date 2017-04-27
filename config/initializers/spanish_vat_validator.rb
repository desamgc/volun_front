class SpanishVatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless validate_vat(value)
      record.errors[attribute] <<
        (options[:message] ||
          I18n.t('activerecord.errors.messages.invalid_document_number', default: 'Invalid document number'))
    end
  end

  def validate_vat(passed_value)
    return false if passed_value.nil?
    value = passed_value.clone
    case
    when value.match(/[0-9]{8}[a-z]/i)
      validate_nif(value)
    when value.match(/[a-wyz][0-9]{7}[0-9a-z]/i)
      validate_cif(value)
    when value.match(/[x][0-9]{7,8}[a-z]/i)
      validate_nie(value)
    else
      false
    end
  end

  # Validates NIF
  def validate_nif(value)
    letters = "TRWAGMYFPDXBNJZSQVHLCKE"
    check = value.slice!(value.length - 1..value.length - 1).upcase
    calculated_letter = letters[value.to_i % 23].chr
    check === calculated_letter
  end

  # Validates CIF
  def validate_cif(value)
    letter = value.slice!(0).chr.upcase
    check = value.slice!(value.length - 1).chr.upcase

    n1 = n2 = 0
    for idx in 0..value.length - 1
      number = value.slice!(0).chr.to_i
      if (idx % 2) != 0
        n1 += number
      else
        n2 += ((2*number) % 10) + ((2 * number) / 10)
      end
    end
    calculated_number = (10 - ((n1 + n2) % 10)) % 10
    calculated_letter = (64 + calculated_number).chr

    if letter.match(/[QPNSW]/)
      check.to_s == calculated_letter.to_s
    else
      check.to_i == calculated_number.to_i
    end
  end

  # Validates NIE, in fact is a fake, a NIE is really a NIF with first number changed to capital 'X' letter, so we change the first X to a 0 and then try to
  # pass the nif validator
  def validate_nie(value)
    value[0] = '0'
    value.slice(0) if value.size > 9
    validate_nif(value)
  end
end