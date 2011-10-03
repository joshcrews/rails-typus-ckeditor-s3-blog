class Background
  
  def Background.make_listing_renewal_emails
    listings_about_to_renew = JobListing.published.where("renews_on > ?", Time.now - (RENEWAL_NOTICE_WINDOW - 1.days))
    listings_about_to_renew.each {|listing| listing.create_renewal_email}
  end
  
  
  def Background.send_daily_emails
    Background.make_listing_renewal_emails
    
    emails = JobListingRenewalNotice.not_sent
    emails.each {|e| e.send_message }
  end
  
  def Background.send_monthly_job_seeker_email
    User.job_seeker_email_subscribers.each do |user|
      MailSender.monthly_jobs_email(user, user.recommended_jobs_listings).deliver
    end
    
  end
  
end