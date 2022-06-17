class Calculator
  def self.daily_salary
    @monthly_salary.to_i / 30
  end

  def self.year_worked_days
    (@end_date.to_i - @start_date.to_i).to_i
  end

  def self.vacations
    @vacation_days.to_i * daily_salary.to_i / 365 * year_worked_days.to_i
  end

  def self.vacation_bonus_total
    vacations * @vacation_bonus.to_i / 100
  end

  def self.christmas_bonus
    daily_salary.to_i * @christmas_bonus_days.to_i / 365 * year_worked_days.to_i
  end

  def self.unpaid_working_days
    daily_salary.to_i * @unpaid_days.to_i
  end

  def self.compensation
    if @cause_of_termination == "unjustified laid off"
      daily_salary.to_i * 90
    else
      0
    end
  end

  def self.total
    vacation_bonus_total + christmas_bonus + unpaid_working_days + compensation
  end
end
