require 'green_shoes'

require 'chef'
require 'chef/knife'

puts "Loading knife configuration..."

Chef::Knife.load_commands
list_of_commands = []
Chef::Knife.list_commands.map {|i| list_of_commands << i[0]}

subcommands = Chef::Knife.subcommands_by_category

puts subcommands

Shoes.app height: 150, width: 250 do
  background rgb(200, 200, 200)
  stack margin: 10 do
    para "Choose a command:"
    list_box items: list_of_commands, choose: list_of_commands[0] do |list|
      s = subcommands["#{list.text}"].map{|i| i.gsub("_"," ").sub("#{list.text} ","")}
      @a.clear do
        list_box items: s, choose: s[0]
      end
    end

    @a = stack

    button "Go!"
  end

end
