module BiddingsHelper
  def bidding_states(state)
    case state
    when 5
      'Publicada'
    when 6
      'Cerrada'
    when 7
      'Desierta'
    when 18
      'Adjudicada'
    when 19
      'Suspendida'
    end
  end
end