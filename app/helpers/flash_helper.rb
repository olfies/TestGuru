module FlashHelper
  def flash_message(flashes)
    flashes.each do |flash|
      content_tag(:p, flash[:message], class: 'flash-message') if flash.is_a?(Hash) && flash[:message]
    end
  end
end
