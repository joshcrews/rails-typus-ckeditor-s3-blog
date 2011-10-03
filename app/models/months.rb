class Months
  def Months.with_a_blog_post(posts)
    posts.collect{|p| p.month}.uniq_by {|m| m.name}.reverse 
  end
  
end