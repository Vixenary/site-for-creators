local nav = io.open('./templates/sitemap.html', 'r')
local navContent = nav:read("*a")
nav:close()
local navPandocContent = pandoc.read(navContent, "html")
--print(navPandocContent.blocks[1].content[1].content[1].text)

for line in navContent:gmatch("([^\n]*)\n?") do
  print(line)
end

return {
  {
    Meta = function(meta)
      for k,v in pairs(meta) do
        print(k, v)
      end
    end,
  }
}