class NameValidator < ActiveModel::Validator


  def validate(record)

    if record.name.nil? || record.name.length != 2
      record.errors.add(:name, :not_2, {message: "Le champ doit être de deux caracteres"} )
    end

    if record.content.nil? || record.content.length != 2
      record.errors.add(:content, "Le champ doit être de deux caracteres")
    end

  end

end
