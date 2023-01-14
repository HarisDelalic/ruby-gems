module CoursesHelper
  def enroll_button(course)
    if current_user.present?
      if current_user == course.user
        link_to 'Check your course', course_path(course)
      elsif course.already_bought_by?(current_user)
        link_to 'You already bought this course. Keep learning', course_path(course)
      elsif course.price > 0
        link_to number_to_currency(course.price), new_course_enrollment_path(course), class: 'btn btn-sm btn-success'
      elsif course.price == 0
        link_to 'Enroll for free!', new_course_enrollment_path(course), class: 'btn btn-sm btn-success'
      end
    else
      link_to 'Check price', course_path(course), class: 'btn btn-sm btn-success'
    end
  end
end
