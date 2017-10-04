require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
driver.get "https://www.jackpotjoy.com"

puts "Page title is #{driver.title}"
element = driver.switch_to.frame driver.find_element(class: 'close-cookie-policy').click
element = driver.switch_to.frame driver.find_element(class: 'button-show-login').click
user_name = wait.until{
    element = driver.find_element(:name,"username")
    element if element.displayed?
}
user_name.send_keys("<username>")

password = driver.find_element(:name,"password")
password.send_keys("<password>")
element = driver.switch_to.frame driver.find_element(class: 'button-login').click
wait.until { driver.title.downcase.start_with? "Welcome to Jackpotjoy™" }


driver.quit