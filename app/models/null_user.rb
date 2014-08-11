class NullUser
  def admin?
    false
  end

  def can_change?(post)
    false
  end
end
