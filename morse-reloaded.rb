module                    Morse

 A,B,C=proc{M.tr(' ','').gsub(/#{$/}+/,$/).split($/).map{|x|
x[/(.)(.+)(.).*\1\2\3/,2].to_i(16)}},proc{|c|A[][c-65].to_s(2
    )[1..-1].tr('10','-.')},proc{|m|(A[].index(("1"+m.tr(
              '-.','10')).to_i(2))||return)+65}              

def                  self.encode(str)
         str.upcase.split(//).map{|c|(65..90)===
      (c=c[0])?B[c]:c==32?'|':nil}.compact.join(' ')
                                                          end

def                  self.decode(str)
 str.split(' ').map{|m|m[0]==?|?' ':(m=C[m])&&m.chr}.join
                                                          end

                   self.methods(false).
               map{|m|class<<self;self;end.
            send(:define_method,m+"_file"){|f|
      File.readlines(f).map{|l|send(m,l)}.join $/}}


M =              <<-'LETS GO MORSING!'
   3DC5D1BBFBE596573E0EE011500C2959ED1469891C5D9120EA8
   D18A6BF9C806A8A15A77A5788575BD18A0233578435B20884FE
                          
                       A1AAAAAA1AA 
                   BCD             BCD
                   123             123
              412C127               140C127
                      87EB9557EB757      
   
         7103B03517D082301871039DD318B6ABEB04981
         2A44EFBD92A0B694FE1ECC094F42E7F7DF37AF7
         9781      765A3C96E24326A0F58      1764
         2D3C        3399D0D588D492D        3A95
         AB74          D14522116D1          45E3
         6833      7     A807B37     A      F32E
         BD57      4F      C61      EC      613F
         07EF      733E     F     7DEA      540F
         E285      04F691       656291      6595
         85EC      1D8343A     C1D82A1      9F95
         F5A3      7F8D02D25A357BEDC75      4958
         86C8      61F6679FFEB2DF19CEC      8673
         0706      DC3C81C810CBEBA76FC      CC3C 
         32B7      91791ADFE02C7664F6E      7D51
         1111      656B15AA24FF66461FD      1111
         0BD60F270C533AE418A5A99E65950BD26D003CF
         1BC023CDEBA3CE19D0CF7E0B50607C7E19DD396
   
   
   11B878DCDAEAE1AE136657420A26AF87356FCD6DA11B80CDD4F
   22C2201C00354CD948A67CAAA92566A7E4515CAADADC8FA01C0
                     LETS GO MORSING!
                                                          end