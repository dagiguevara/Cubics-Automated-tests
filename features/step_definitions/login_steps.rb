driver = Selenium::WebDriver.for :chrome

Given("I am on the cubics login page on URL {string}") do |string|
    driver.navigate.to "https://cubits.com/users/sign_in"
    sleep 2
end
  
  Then("I should see {string} message") do |loginMessage|
 driver.find_element(:xpath, '/html/body/div[2]/div/h1/b').text.should match("LOG IN TO CUBITS")
end
  
  When("I fill in email with {string}") do |email|
    driver.find_element(:id, 'user_email').send_keys(email)
end

  When("I fill in Password with {string}") do |password|
    driver.find_element(:id, 'user_password').send_keys(password)
end

  When("I click on the {string} button") do |login|
    driver.find_element(:xpath, '//*[@id="new_user"]/div[1]/button').click   
end
  
  Then("I should see activity page {string} message") do |message|
    driver.find_element(:xpath, '//*[@id="activities-region"]/div/div[1]/div[1]/div[2]/h3').text.should match('WELCOME DONALDO')
    driver.find_element(:class, 'hprofile__user').click
    driver.find_element(:id, 'logout_link').click
    sleep 2    
end

  Then ("I should see error message {string}") do |errorMessage|
    driver.find_element(:class, 'field').text.should match(errorMessage)  
end
  

 