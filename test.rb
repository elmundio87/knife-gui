require 'green_shoes'

require 'chef'
require 'chef/knife'

puts "Loading knife configuration..."

Chef::Knife.load_commands
list_of_commands = []
Chef::Knife.list_commands.map {|i| list_of_commands << i[0]}

subcommands_by_category = Chef::Knife.subcommands_by_category
subcommands = Chef::Knife.subcommands

Shoes.app height: 150, width: 250 do
  background rgb(200, 200, 200)
  stack margin: 10 do
    para "Choose a command:"
    list_box items: list_of_commands, choose: list_of_commands[0] do |list|
      s = subcommands_by_category["#{list.text}"]
      @a.clear do
        list_box items: s, choose: s[0] do |subcommand|
          @b.clear do
            subcommands["cs_server_create"].options.each do |i,j|
              para "#{j[:description]}"
              edit_line
            end
          end
        end
      end
    end
    @a = stack margin: 10
    @b = stack margin: 10
    button "Go!"
  end

end
