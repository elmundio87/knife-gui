require 'green_shoes'

require 'chef'
require 'chef/knife'

puts "Loading knife configuration..."

Chef::Knife.load_commands
list_of_commands = []
Chef::Knife.list_commands.map {|i| list_of_commands << i[0]}

subcommands_by_category = Chef::Knife.subcommands_by_category
subcommands = Chef::Knife.subcommands

Shoes.app height: 600, width: 800 do
  background rgb(200, 200, 200)
  
    stack width: 10000 do
      para "Choose a command:"
      
      flow do
      list_box items: list_of_commands, choose: list_of_commands[0] do |list|
        @a.items = subcommands_by_category["#{list.text}"] 
      end

      @a = list_box do |subcommand|
          @b.clear do
            subcommands["#{subcommand.text}"].options.each do |i,j|
                para "#{j[:description]}"
                edit_line
            end
        end
      end
      edit_line
    end


      @b = stack margin: 10

    button "Go!"
  end

end
