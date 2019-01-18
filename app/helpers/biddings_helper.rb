module BiddingsHelper
  def bidding_states(state)
    case state
    when 5
      "<small class='label bg-green'>Publicada</small>".html_safe
    when 6
      "<small class='label bg-red'>Cerrada</small>".html_safe
    when 7
      "<small class='label bg-red'>Desierta</small>".html_safe
    when 18
      "<small class='label bg-red'>Adjudicada</small>".html_safe
    when 19
      "<small class='label bg-red'>Suspendida</small>".html_safe
    end
  end
end