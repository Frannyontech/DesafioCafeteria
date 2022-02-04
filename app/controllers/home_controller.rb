class HomeController < ApplicationController
  def index
    @sales_by_month = Sale.group_by_month(:date_sales, last: 12, format:"%B %Y").order("date_sales ASC").sum(:price)
    @sales_by_count = Sale.group_by_month(:date_sales, last: 12, format:"%B %Y").order("date_sales ASC").count
    @sales_by_average = Sale.group_by_month(:date_sales, last: 12, format:"%B %Y").order("date_sales ASC").average(:price)

    @sales_by_origin_12 = Sale.where(created_at: 11.months.ago..Date.today).group(:origin).limit(30).count
    @sales_by_origin_6 = Sale.where(created_at: 5.months.ago..Date.today).group(:origin).limit(30).count
    @sales_by_origin_3 = Sale.where(created_at: 2.months.ago..Date.today).group(:origin).count
    @sales_by_origin_1 = Sale.where(created_at: 30.days.ago..Date.today).group(:origin).count

    @sales_by_blend_12 = Sale.where(created_at: 11.months.ago..Date.today).group(:blend).limit(30).count
    @sales_by_blend_6 = Sale.where(created_at: 5.months.ago..Date.today).group(:blend).limit(30).count
    @sales_by_blend_3 = Sale.where(created_at: 2.months.ago..Date.today).group(:blend).limit(30).count
    @sales_by_blend_1 = Sale.where(created_at: 30.days.ago..Date.today).group(:blend).limit(30).count
  end
end
