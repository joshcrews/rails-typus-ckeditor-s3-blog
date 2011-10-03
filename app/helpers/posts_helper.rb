module PostsHelper
  
  def archives
    Months.with_a_blog_post(Post.order('id DESC')).collect{|m| OpenStruct.new(:name => m.name + " (#{number_of_posts_in_this_month(Post.order('id DESC'), m)})", :url_name => m.url_name)}
  end
  
  def number_of_posts_in_this_month(posts, month)
    posts.by_month(month.date).size
  end
  
  def blog_preview(text, post)
    short_text = strip_tags(text).split(" ", 20)[0..18].join(" ")
    if short_text == strip_tags(text)
      text
    else
      short_text + "..." + "<br/>" + link_to("Read more", blog_path(post))
    end
  end
  
end
