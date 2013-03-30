module GradesHelper
  
  # This converts numeric grades to letter grades.
  def letter_grade(number_grade)
    if number_grade
      if number_grade > 97
        "A+"
      elsif number_grade > 92
        "A"
      elsif number_grade > 89
        "A-"
      elsif number_grade > 87
        "B+"
      elsif number_grade > 82
        "B"
      elsif number_grade > 79
        "B-"
      elsif number_grade > 77
        "C+"
      elsif number_grade > 72
        "C"
      elsif number_grade > 69
        "C-"
      elsif number_grade > 67
        "D+"
      elsif number_grade > 62
        "D"
      elsif number_grade > 59
        "D-"
      else
        "F"
      end
    else
      "Pending"
    end
  end
  
end
