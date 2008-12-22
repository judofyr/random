# Factoring n
def f(n)(1..n).inject(1){|m,e|m*=e}end

# Find the number in a Pascal-triangle (row, column)
def p(r,c)f(r)/(f(c)*f(r-c))end

# Builds a Pascal-triangle (number of lines, extra width)
def t(n,w=1)(r=(0...n).map{|r|(0..r).inject(""){|m,c|m<<p(r,c).to_s.center(p(n,n/2).to_s.length+w)}}).map{|x|x.center(r.last.length)}end

