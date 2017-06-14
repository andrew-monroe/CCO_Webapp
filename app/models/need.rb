class Need < ApplicationRecord
  validates :galaxy_id, uniqueness: true, presence: true
  belongs_to :agency

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

  def time_range
    if self.start_date_time.strftime("%Y:%m:%d") == self.end_date_time.strftime("%Y:%m:%d")
      self.start_date_time.strftime("%b %d (%a) %l:%M%p - ") + self.end_date_time.strftime("%l:%M%p")
    else
      self.start_date_time.strftime("%b %d (%a) %l:%M%p - ") + self.end_date_time.strftime("%b %d (%a) %l:%M%p")
    end
  end

  def formatted_datetime(time)
    time.strftime("%A %B %e, %Y\n%l:%M%p")
  end

  def formatted_start_datetime()
    self.start_date_time.strftime("%A %B %e, %Y\n%l:%M%p")
  end

  def formatted_end_datetime()
    self.end_date_time.strftime("%A %B %e, %Y\n%l:%M%p")
  end

  def self.get_some_needs(offset=0,amount=15)
    offset = offset.to_i < 0 ? 0 : offset.to_i
    amount = amount.to_i
    Need.limit(amount).offset(offset*amount).order(:start_date_time)
  end

  def fetch_volunteer_responses
    self.volunteers_signed_up = GalaxyNeedFetcher.new.get_volunteers_signed_up_count(self.galaxy_id)
    self.save
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
