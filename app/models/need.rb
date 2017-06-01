class Need < ApplicationRecord
  def time_range(start_time, end_time)
    if start_time.strftime("%Y:%m:%d") == end_time.strftime("%Y:%m:%d")
      start_time.strftime("%b %d (%a) %l:%M%p - ") + end_time.strftime("%l:%M%p")
    else
      start_time.strftime("%b %d (%a) %l:%M%p - ") + end_time.strftime("%b %d (%a) %l:%M%p")
    end
  end

  def get_recent
    Need.find(:all, :order => "start_time desc", :limit => 10)
  end
end
