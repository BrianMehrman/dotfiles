#!/usr/bin/env ruby

begin
  require 'irb/completion'
  require 'rubygems'
rescue Exception => e
  puts "#{e} \nOne of the gems did NOT load. Take a look at your ~/.irbrc file"
end



class Object
  def int_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end



module BackstageHelper

  def user(email='-')
    User.find_by_email(email) || User.find_by_email('t.szymczak@tukaiz.com')
  end

  def me(sf_id = 24)
    StoreFront.current = StoreFront.find(sf_id)
    StoreFrontUser.current = StoreFrontUser.find_by_store_front_id_and_user_id(sf_id, user.id)
    "StoreFront: #{StoreFront.current.id}, #{StoreFront.current.name} | StoreFrontUser: #{StoreFrontUser.current.id} | User: #{user.id}"
  end

  def current_store_front
    StoreFront.current
  end

  def current_store_front_user
    StoreFrontUser.current
  end

  def csf
    StoreFront.current
  end

  def csfu
    StoreFrontUser.current
  end

  def sfs
    awesome_print StoreFront.all.map{|sf| "#{sf.id} | #{sf.name}" }; nil
  end
end

if Dir.pwd == '/Users/tatum/Code/TKML/backstage_ci_tatum'
  puts 'Loading Backstage Helpers. current_store_front, current_store_front_user, csf, csfu'
  include BackstageHelper
end

