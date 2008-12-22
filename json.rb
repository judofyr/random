require 'yaml'

# Who needs JSON when we have YAML?
#                                              
# http://redhanded.hobix.com/inspect/jsonCloserToYamlButNoCigarThanksAlotWhitespace.html
# http://project.ioni.st/post/1067#snippet_1067
class JSON
  def self.parse(json)
    YAML.load(convert(json))
  end
  
  def self.convert(json)
    quoting, escaping = false, false
    json.split(//).map do |char|
      escaping = false or next char if escaping
      case char
      when '"'
        quoting = quoting == char ? false : char
      when "\\"
        escaping = true if quoting
      when ":", ","
        char << " " unless quoting
      end
      char
    end.join('')
  end
end