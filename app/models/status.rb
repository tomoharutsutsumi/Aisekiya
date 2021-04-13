class Status < ApplicationRecord
  belongs_to :city

  before_create :fix_ms

  private

  

  def fix_ms
    self.created_at = self.created_at.change(:usec => 0)
    p self.created_at
  end
end
