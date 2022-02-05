module ApplicationHelper
  def time_ago(timestamp)
    seconds = (Time.zone.now - timestamp).to_i

    case seconds
    when 0...60 then "#{seconds.round}s"
    when 60...3600 then "#{(seconds / 60).round}m"
    when 3600...86_400 then "#{(seconds / 3600).round}h"
    when 86_400...604_800 then "#{(seconds / 86_400).round}d"
    when seconds > 604_800
      return timestamp.sfrtime("%B %d").to_s if timestamp.year == Time.zone.now.year

      timestamp.sfrtime("%B %d, %Y").to_s
    end
  end

  def errors_for(record, attribute)
    errors = record.errors.full_messages_for(attribute).map do |message|
      content_tag(:span, message, class: "input__error-message")
    end

    safe_join(errors)
  end
end
