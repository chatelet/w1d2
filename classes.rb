class Student

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    @first_name + " " + @last_name
  end

  def courses
    result = []
    @courses.each do |i|
      result << i.name
    end
    result
  end

  def enroll(c)
    @courses.each do |i|
      if i.conflicts_with?(c)
        puts "scheduling conflicts"
        return
      end
    end
    @courses.push(c) unless @courses.include?(c)
    c.student_list.push(self.name)
  end

  def course_load
    courseload = {}
    @courses.each do |i|
      courseload[i.department] = i.credits
    end
    courseload
  end

end

class Course
  attr_reader :student_list, :department, :credits, :day_course
  def initialize(course_name, department, credits, day_course)
    @course_name = course_name
    @department = department
    @credits = credits
    @student_list = []
    @day_course = day_course
  end

  def students
    @student_list
  end

  def add_student(s)
    s.enroll(self)
  end

  def name
    @course_name
  end

  def conflicts_with?(c2)
    self.day_course.keys.each do |k|
      if c2.day_course[k] == self.day_course[k]
        return true
      end
    end
    false
  end

end
