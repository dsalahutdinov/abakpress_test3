class LessCondition < CompareCondition
  def to_s
    return "#{field_name.to_s} < #{value}"
  end
end