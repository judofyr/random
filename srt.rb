# Takes two arguments: filename and seconds to shift
# `ruby srt.rb quantum_of_solace.srt 10.67 > better_quantum_of_solace.srt`
require 'time'

puts File.read(ARGV[0]).gsub(/^(.*) --> (.*)$/){[
$1,$2].map{|x|(t=Time.parse(x.strip)+ARGV[1].to_f
).strftime("%H:%M:%S,#{t.usec}00")[0,12]}*' --> '}