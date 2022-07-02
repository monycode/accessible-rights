class Calculation
  include ActiveModel::Model
  validates :end_date, :start_date, :monthly_salary, :vacation_days, :christmas_bonus_days, :cause_of_termination, presence: true
  attr_reader :end_date, :start_date, :monthly_salary, :vacation_days, :christmas_bonus_days
  attr_accessor :cause_of_termination

  def end_date=(value)
    @end_date = Date.parse(value || Date.current.to_s)
  end

  def start_date=(value)
    @start_date = Date.parse(value || Date.current.beginning_of_year.to_s)
  end

  def monthly_salary=(value)
    @monthly_salary = value.to_i
  end

  def vacation_days=(value)
    @vacation_days = value.to_i
  end

  def christmas_bonus_days=(value)
    @christmas_bonus_days = value.to_i
  end

  def daily_salary
    @monthly_salary / 30.0
  end

  def year_worked_days
    (@end_date - current_year_start_date).to_i
  end

  def current_year_start_date
    [@end_date.beginning_of_year, @start_date].max
  end

  def vacations_compensation
    @vacation_days * daily_salary / 365.00 * year_worked_days
  end

  def christmas_bonus_compensation
    daily_salary * @christmas_bonus_days / 365.00 * year_worked_days
  end

  def current_month_start_date
    [@end_date.beginning_of_month, @start_date].max
  end

  def unpaid_days
    if @end_date.day < 15
      return (@end_date - current_month_start_date).to_i + 1
    else
      return (@end_date - (current_month_start_date + 14)).to_i
    end
  end

  def unpaid_working_days
    daily_salary * unpaid_days
  end

  def cause_of_termination_compensation
    if @cause_of_termination == "Unjustified dismissal"
      @monthly_salary * 3
    else
      0
    end
  end

  def total_compensation
    vacations_compensation + christmas_bonus_compensation + unpaid_working_days + cause_of_termination_compensation
  end
end
