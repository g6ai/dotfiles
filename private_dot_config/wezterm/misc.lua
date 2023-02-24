local module = {}

function module.basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

return module
