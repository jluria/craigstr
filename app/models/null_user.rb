class NullUser
  def admin?
    false
  end

  def can_change?(post)
    false
  end

  def not_flagged_as_spam?(post)
    false
  end
end
