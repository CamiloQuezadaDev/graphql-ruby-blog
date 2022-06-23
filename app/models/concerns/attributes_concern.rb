module AttributesConcern
  extend ActiveSupport::Concern

  def attributes_strip
    self.attributes.each do | attr_name, attr_value |
      self[attr_name.to_sym] = attr_value.strip if attr_value.present? && attr_value.kind_of?(String)
    end
  end
end