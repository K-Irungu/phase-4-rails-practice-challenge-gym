class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_paid_for_memberships

  # This method returns the sum of all membership charges for a given client
  def total_paid_for_memberships
    object.memberships.sum(:charge)
  end
  
end
