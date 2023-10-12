module FlashHelper
  def flash_message_exists?(key)
    flash[key].present? if flash
  end
end
