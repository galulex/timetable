module ApplicationHelper

  def error_tag(error)
    unless error.blank?
      content_tag(:span, error.is_a?(Array) ? error.first : error, :class => :error)
    end
  end

  def facebook_url
    fb_client.authorize_url(:scope => 'email')
  end

  def schedule_action
    @schedule.published? ? t('.unpublish') : t('.publish')
  end

  def lesson_link(lesson)
    link_to('+', new_schedule_lesson_path(@schedule, :group_id => lesson.group_id,
                                          :day_id => lesson.day_id, :schedule_call_id => lesson.schedule_call_id),
                                          :rel => :lazybox, :class => 'add_lesson_link', :id => lesson.link_id)
  end

end
