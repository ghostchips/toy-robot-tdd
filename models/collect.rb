
class Collect
attr_accessor :commands

  def collect_commands
    # get commands from user, store each in a commands array.
    @commands = []
    loop do
      command = gets.chomp.upcase
      @commands.push(command)
      # Stop collecting user commands if user asks for 'REPORT' command.
      if command == 'REPORT'
        break
      end
    end

  end

end
