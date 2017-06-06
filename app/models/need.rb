class Need < ApplicationRecord
  def time_range(start_time, end_time)
    if start_time.strftime("%Y:%m:%d") == end_time.strftime("%Y:%m:%d")
      start_time.strftime("%b %d (%a) %l:%M%p - ") + end_time.strftime("%l:%M%p")
    else
      start_time.strftime("%b %d (%a) %l:%M%p - ") + end_time.strftime("%b %d (%a) %l:%M%p")
    end
  end

  def formatted_datetime(time)
    time.strftime("%A %B %e, %Y\n%l:%M%p")
  end

  def get_recent
    Need.find(:all, :order => "start_time desc", :limit => 10)
  end

  def no_space_location
    spaces_to_pluses(self.location)
  end

  def pretty_class_name
    if self.volunteers_needed == 0 || self.volunteers_needed == nil
      "no-limit"
    elsif self.volunteers_signed_up == 0
      "none"
    elsif self.volunteers_needed == self.volunteers_signed_up
      "full"
    else
      ""
    end
  end

  private
  def spaces_to_pluses(str)
    no_space_str = ''
    str.each_char do |c|
      if c == ' '
        no_space_str += '+'
      else
        no_space_str += c
      end
    end
    no_space_str
  end
end
