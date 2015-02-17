module ApplicationHelper
  def catalog_list
    @cats = Cat.where(:fold => 0).preload(:cats)
  end

  def parents_list
    return Tovar.find(params[:id]).cat.parents.map(&:id) + [Tovar.find(params[:id]).cat.id] if params[:action] == 'tovar'
    return Cat.find(params[:id]).parents.map(&:id) + [Cat.find(params[:id]).id]
  end
end
