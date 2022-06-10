module ApplicationHelper
  def current_order
    if !session[:order_id].nil?
      order = Order.find(session[:order_id])
    else
      order = Order.new
    end
    if user_signed_in?
      previous_order = current_user.order if current_user.order.present?
      if previous_order&.order_items&.count&.positive?
        order.order_items.update_all(order_id: previous_order.id)
      end
      order.user = current_user if previous_order.blank?
    end
    previous_order.present? ? previous_order : order
  end
end
