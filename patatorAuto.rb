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

#process the user inputs
def process(input)
    case input
    when "end"
        bye()
    when "help"
        displayHelp()
    when "modules"
        printModules()
    else
        puts "Wrong options"
        displayHelp()
    end

end

# Start he main 
greetings()
# create the prompt
prompt = TTY::Prompt.new

# main loop
while $running


    input = prompt.ask("PatatorAuto > ")

    process(input)
end