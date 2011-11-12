
# here are some string techniques
# here %w is same as %W
# any special character can be used to mark begin and end of your string

sample_string = %w( This WILL create a list of strings here you don't have \
to type the quotes )

sample_string = %q{"Stop", she said, "I can't live without 's and "s."}

# document string
sample_string = <<EOF
  Here you can type anythin, This can work as a doc string.
It can contain ' or " but it will skip \ but still can contain
\\ that's it.
It's output will be a single string
EOF

# substitution or replacing words form a string

sample_string = "rain rain go away come again another day"
sample_string.sub('rain','train')
sample_string.gsub('rain','train')

# Iterating to each character,bytes or lines in a string
sample_string.each_char { |c| puts c } 
sample_string.each_byte { |b| puts b }
sample_string.each_line { |line| puts line}

