def protect(gvar)
  value = eval(gvar.to_s)
  setter = eval("lambda { |val| #{gvar} = val }")
  trace_var(gvar) do |v|
    setter[value] unless v == value
  end
end

$hello = 123
protect('$hello')
$hello = 456
puts $hello  # => 123

