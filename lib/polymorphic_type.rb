module PolymorphicType
  def reviewable_type
    self.class.name
  end
end
