module ApplicationHelper

  def error_tag(error)
    unless error.blank?
      content_tag(:span, error.is_a?(Array) ? error.first : error, :class => :error)
    end
  end

  def facebook_url
    fb_client.authorize_url(:scope => 'email')
  end

end
