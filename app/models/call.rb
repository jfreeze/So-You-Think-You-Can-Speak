class Call < ActiveRecord::Base
  def self.last_calls(delay=60)
    t = Time.now
    where(self.arel_table[:created_at].in(t-delay..t))
  end
  
  def self.total
    last_calls.sum('vote')
  end
  

end
