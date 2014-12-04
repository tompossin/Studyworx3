module Grading
  protected
  # This Module provides shared methods for grading, particularly for totals and averaging.
  # These methods will be used mostly for reports
  
  # TODO this method and quarterly_grade_average below it need to be modified to work in Studyworx 3
  # These are imports from Studyworx 2
  def grade_average(school_id,user_id)
    results = Assignment.find_by_sql(["
      SELECT (sum(grades.grade * assignments.weight)/sum(assignments.weight)) AS total
      FROM assignments
      LEFT JOIN grades ON (assignments.id = grades.assignment_id)
      WHERE assignments.school_id=? and grades.user_id=?
      GROUP BY grades.user_id",school_id,user_id])
    grade = results[0]['total'].to_i unless results.count == 0
    pending = "pending"
    return grade || pending
  end

  def quarterly_grade_average(school_id,participant_id,quarter)
    results = Assignment.find_by_sql(["
      SELECT (sum(grades.grade * assignments.weight)/sum(assignments.weight)) AS total
      FROM assignments
      LEFT JOIN grades ON (assignments.id = grades.assignment_id)
      WHERE assignments.quarter=? and assignments.school_id=? and grades.participant_id=?
      GROUP BY grades.participant_id",quarter,school_id,participant_id])
    grade = results[0]['total'].to_i unless results.count == 0
    return grade || nil
  end
  
end