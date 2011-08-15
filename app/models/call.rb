class Call < ActiveRecord::Base
  def self.last_calls
    t = Time.now
    where(self.arel_table[:created_at].in(t-60..t))
  end
  
  def self.total
    last_calls.sum('vote')
  end
end
