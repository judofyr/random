module Morse;A=[19,189,192,63,6,165,66,162,18,175,64,171,22,21,67,174,199,57,
54,7,55,163,58,190,193,198];B=proc{|c|A[c-65].to_s(3)[1..-1].tr('10','-.')}
C=proc{|m|(A.index(("2"+m.tr('-.','10')).to_i(3))||return)+65}

def self.encode(str);str.upcase.split(//).map{|c|(65..
  90)===(c=c[0])?B[c]:c==32?'|':nil}.compact.join(' ')
end

def self.decode(str);str.split(' ').map{|m|m[0]==?|?' ':(m=C[m])&&m.chr}.join
end

self.methods(false).map{|m|class<<self;self;end.send(:define_method,m+"_file"
){|f|File.readlines(f).map{|l|send(m,l)}.join $/}}

end

# >> Morse.encode("Concise and elegant")
# => "-.-. --- -. -.-. .. ... . | .- -. -.. | . .-.. . --. .- -. -"
# >> Morse.decode("-.-. --- -. -.-. .. ... . | .- -. -.. | . .-.. . --. .- -. -")
# => "CONCISE AND ELEGANT"
# >> Morse.encode_file("somefile.txt")
# >> Morse.decode_file("somefile.txt")