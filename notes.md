This gets a data structure that contains all knife commands
```
require 'chef'
require 'chef/knife'

Chef::Knife.load_commands
commands = Chef::Knife.list_commands
```

# Possible GUI frameworks

- shoes [github](https://github.com/shoes/shoes4)
- wxruby [github](https://github.com/sfeu/wxruby)

# What will it do?

- Get the list of plugins from the Chef::Knife API
- Provide a UI with labelled [text|check]boxes taken from the plugin usage guide
- Native windows look and feel
- Provide a way to save+load plugin configurations (xml/yml/??)



