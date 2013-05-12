class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
  belongs_to :school
  
  attr_accessible :assignment_id, :grade, :school_id, :scratchpad, :staff_comments, :staff_id, :student_comments, :user_id, :viewable, :done, :returned
  
  validates_numericality_of :grade, :only_integer => true, :allow_nil => true, :less_than_or_equal_to => 100
  
  # Finds or creates grades (staff not yet assigned) records from the student perspective.
  #
  # This is called before the form is loaded, so that there is a real record w/ an id to work on.
  # The staff_id is assigned by the update call when the student submits the form.
  def self.hand_in_to_staff(school_id,assignment_id,student_id)
    grade = self.where("school_id = ? and assignment_id = ? and user_id = ?",school_id, assignment_id, student_id).first
    unless grade
      scoresheet = Scoresheet.find_or_default(assignment_id)
      grade = self.create(school_id: school_id, assignment_id: assignment_id, user_id: student_id,scratchpad: scoresheet)
    end
    return grade    
  end
  
  # Finds or creates grade records from the staff perspective. It also updates the staff_id of the record.
  def self.assign_staff_to_student(school_id,assignment_id,student_id,staff_id)
    grade = self.where("school_id = ? and assignment_id = ? and user_id = ?",school_id, assignment_id, student_id).first
    unless grade
      scoresheet = Scoresheet.find_or_default(assignment_id)
      grade = self.create(school_id: school_id, assignment_id: assignment_id, user_id: student_id,scratchpad: scoresheet)
    end
    grade.staff_id = staff_id
    grade.returned = false
    grade.save  
  end
  
  # The name sort of says it all. Does the batch assignments chosen from the collect page.
  def self.assign_students_and_assignments_to_staff(school_id,assignment_ids,student_ids,staff_id)
    student_ids.each do |s|
      assignment_ids.each do |a|
        self.assign_staff_to_student(school_id,a.to_i,s.to_i,staff_id)
      end
    end
  end
  
  def duetime
    student = User.find(self.user_id)
    team = student.coreteam
    if team
      due = Duedate.where("assignment_id = ? and team_id = ?",self.assignment_id, team.id).first
      time = Time.now.in_time_zone
      if due and due.duedate > time
        return due.duedate
      else
        return false
      end
    else
      return false
    end
  end
  
end

