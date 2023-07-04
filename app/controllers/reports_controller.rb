class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    start_date = params[:startDate]
    end_date = params[:endDate]
    operation_data_by_c = Operation.where(odate: start_date..end_date).map{|o| [o.category, o.amount]}
    @categories_by_c = operation_data_by_c.map{|e| e[0].name}
    @amount_by_c = operation_data_by_c.map{|e| e[1]}

  end

  def report_by_dates
      start_date = params[:startDate]
      end_date = params[:endDate]

      operation_data = Operation.all.where(odate: start_date..end_date).map{|o| [o.odate.to_s, o.amount]}
      @dates_by_d = operation_data.map{|e| e[0]}
      @amounts_by_d = operation_data.map{|e|e[1]}
  end

end
