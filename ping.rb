require 'timeout'
def check_ping_ok(ip_address)
      timeout_period = 10
      begin
         Timeout.timeout(timeout_period) do
            result = `ping -n 2 "#{ip_address}"`
	    puts result
            if result = /Request timed out./ || result = /Destination host unreachable./ then
		    puts '22'
               return false
            elsif result = /Packets: Sent = 2, Received = 2, Lost = 0 \(0% loss\)/ && result = /Reply from .+ bytes=.+/ then
               puts '33'
	       return true
            else
		    puts '44'
               return false
            end
         end
      rescue Timeout::Error
         return false
      end
   end
def my_ping(ip_address)
	#timeout_period = 10
        # Timeout.timeout(10) do
            result = `ping -n 2 "#{ip_address}"`
	    puts result
         #end
  end
 def my_ping2()
	 result = `ping -n 2 127.0.0.1`
	 puts result
 end

my_ping('127.0.0.1')
my_ping2
puts check_ping_ok('127.0.0.1')
puts check_ping_ok('192.168.1.1')