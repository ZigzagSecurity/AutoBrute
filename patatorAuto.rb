##############################################################
##                  PatatorAuto V0.1                         #
##      Wrapper for Patator bruteforce tool                  #
##                                                           #
##          Created by ZigzagSecurity                        #
##                                                           #
##############################################################

require 'optionparser'
require 'colorize'
require "tty-prompt"
#scrapper nokogiri
#open3 to execute command

# Global variables
$running = true
# create the prompt
$prompt = TTY::Prompt.new
$modules = hash = { "ssh_module" => "Brute-force SSH" }

# Welcome message
def greetings()
    puts "  
     ____       _        _              _         _        
    |  _ \\ __ _| |_ __ _| |_ ___  _ __ / \\  _   _| |_ ___  
    | |_) / _` | __/ _` | __/ _ \\| '__/ _ \\| | | | __/ _ \\ 
    |  __/ (_| | || (_| | || (_) | | / ___ \\ |_| | || (_) |
    |_|   \\__,_|\\__\\__,_|\\__\\___/|_|/_/   \\_\\__,_|\\__\\___/ 
                                   by ZigzagSecurity V0.1 ".red

end

# End message
def bye()
    puts "Okei, bye !"
    $running = false
end

def displayHelp()
    puts "Here is the help"
end

# print the available modules
def printModules()
    puts "Available modules:\n"
    $modules.each do |x,y|
        puts "#{x}: #{y}"
    end
end

#Examples:
#  ssh_login host=10.0.0.1 user=root password=FILE0 0=passwords.txt -x ignore:mesg='Authentication failed.'
#Module options:
#  host          : target host
#  port          : target port [22]
#  user          : usernames to test
#  password      : passwords to test
#  auth_type     : type of password authentication to use [password|keyboard-interactive|auto]
#  keyfile       : file with RSA, DSA or ECDSA private key to test
#  persistent    : use persistent connections [1|0] 
def ssh_module()
    command = "patator ssh_login host=#{host} user=#{user} password=#{password} -x ignore:mesg='Authentication failed.'"



end

#process the user inputs
def process(input)
    case input
    when "end"
        bye()
    when "help"
        displayHelp()
    when "modules"
        printModules()
    when "use ssh_module"
        ssh_module()
    else
        puts "Wrong options"
        displayHelp()
    end

end

def ask(name)
    return $prompt.ask(name)
end


# Start he main 
greetings()

# main loop
while $running

    input = ask("PatatorAuto > ")
    process(input)

end