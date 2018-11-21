import Command

var registry = CommandRegistry(usage: "<command> <options>", overview: "99 Swift Problems command line tool")

registry.register(command: StartCommand.self)
registry.register(command: UsernameCommand.self)

registry.run()
