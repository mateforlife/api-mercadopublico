module ApplicationHelper

  def add_button
    '<i class="material-icons">add</i>'.html_safe
  end

  def delete_button
    '<i class="material-icons">delete</i>'.html_safe
  end

  def truncate_bidding_name(text)
    text.truncate(80)
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
