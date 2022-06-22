require 'date'

class Calculator
  def self.daily_salary(monthly_salary)
    monthly_salary.to_i / 30
  end

  # def self.year_worked_days
  #   (@end_date - @begin_date).to_i
  # end

  def self.vacations(vacation_days, monthly_salary)
    vacation_days.to_i * (monthly_salary.to_i / 30) / 365 * year_worked_days.to_i
  end

  def self.vacation_bonus_total(vacations, vacation_bonus)
    vacations * vacation_bonus.to_i / 100
  end

  def self.christmas_bonus(monthly_salary, christmas_bonus_days, year_worked_days)
    (monthly_salary.to_i / 30) * christmas_bonus_days.to_i / 365 * year_worked_days.to_i
  end

  def self.unpaid_working_days(monthly_salary, unpaid_days)
    (monthly_salary.to_i / 30) * unpaid_days.to_i
  end

  def self.compensation(cause_of_termination)
    if cause_of_termination == "unjustified laid off"
      daily_salary.to_i * 90
    else
      0
    end
  end

  def self.total
    vacation_bonus_total + christmas_bonus + unpaid_working_days + compensation
  end
end
