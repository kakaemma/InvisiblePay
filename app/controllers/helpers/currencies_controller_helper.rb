module CurrenciesControllerHelper
  def source_target
    (
    params[:source_currency] +
        params[:target_currency]
    ).to_s
  end
end
