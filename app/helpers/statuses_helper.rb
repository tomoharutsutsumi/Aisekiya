module StatusesHelper
  def dates # 4月開始に変える必要あり
    array_dates = (Date.new(2021, 3, 1)...Date.new(Date.today.year, Date.today.month, Date.today.day + 1)).to_a
    dates = array_dates.map{ |d| [d.strftime('%Y年%m月%d日'), d] }
  end
end
