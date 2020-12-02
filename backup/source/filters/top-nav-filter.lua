upperTabLinks = {}
currentUpperTab = "";

function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", math.floor(indent/2)) .. k .. ": "
    if type(v) == "table" then
      if type(k) == "string" then
        print(formatting)
        if indent == 6 then
          if k == "name" and currentUpperTab == "" then
            currentUpperTab = v[1].text;
          elseif k == "path" and currentUpperTab ~= "" then
            upperTabLinks[currentUpperTab] = v[1].text;
            currentUpperTab = "";
          end
        elseif indent == 8 then
          if k == "path" and currentUpperTab ~= "" then
            upperTabLinks[currentUpperTab] = v[1].text;
            currentUpperTab = "";
          end
        elseif indent == 12 then
          if k == "path" and currentUpperTab ~= "" then
            upperTabLinks[currentUpperTab] = v[1].text;
            currentUpperTab = "";
          end
        end
      end
      tprint(v, indent+1)
    else
      print(formatting .. v)
    end
  end
end

function Meta(meta)
  print('Full META table')
  tprint(meta)
  print('')
  print('Upper Tab links')
  tprint(upperTabLinks)
  print('')
  print(upperTabLinks["About"])

  print(ipairs(meta.nav[1].upper_tabs[3].tab[1].name))
  print('')

  --[[
    Cases:
    - Top tab with no link (Unlikely I think)
    - Top tab that links to flat page with no other sitemap links, lower tabs, etc.
    - Top tab that specifies a link and has a sitemap but no lower tabs
    - Top tab that specifies a link and has a sitemap+lower tabs
    - Top tab that doesn't specify a link but has a sitemap
    - Top tab that doesn't specify a link but has sitemap+lower tabs
  ]]--

  for navString, navTable in pairs(meta) do
    if (navTable) then
      print(navString .. ':', navTable)
      for topTabTypeInt, topTabTypeOuterTable in pairs(navTable) do
        if (topTabTypeOuterTable) then
          --print('- ' .. topTabTypeInt .. ':', topTabTypeOuterTable)
          for topTabsString, topTabsInnerTable in pairs(topTabTypeOuterTable) do
            if (topTabsInnerTable) then
              print('- ' .. topTabsString .. ':', topTabsInnerTable)
              if (topTabsString == 'upper_tabs') then
                for topTabInt, topTabOuterTable in pairs(topTabsInnerTable) do
                  if (topTabOuterTable) then
                    --print('  - ' .. topTabInt .. ':', topTabOuterTable)
                    for topTabString, topTabInnerTable in pairs(topTabOuterTable) do
                      if (topTabInnerTable) then
                        print('  - ' .. topTabString .. ':', topTabInnerTable)
                        for topTabNameInt, topTabNameOuterTable in pairs(topTabInnerTable) do
                          if (topTabNameOuterTable) then
                            --print('    - ' .. topTabNameInt .. ':', topTabNameOuterTable)
                            for topTabNameString, topTabNameInnerTable in pairs(topTabNameOuterTable) do
                              if (topTabNameInnerTable) then
                                if (topTabNameString == 'lower_tabs') then
                                  print('    - ' .. topTabNameString .. ':', topTabNameInnerTable)
                                  for lowerTabInt, lowerTabOuterTable in pairs(topTabNameInnerTable) do
                                    if (lowerTabOuterTable) then
                                      --print('      - ' .. lowerTabInt .. ':', lowerTabOuterTable)
                                      for lowerTabString, lowerTabInnerTable in pairs(lowerTabOuterTable) do
                                        if (lowerTabInnerTable) then
                                          print('      - ' .. lowerTabString .. ':', lowerTabInnerTable)
                                          for lowerTabContentsInt, lowerTabContentsOuterTable in pairs(lowerTabInnerTable) do
                                            if (lowerTabContentsOuterTable) then
                                              --print('        - ' .. lowerTabContentsInt .. ':', lowerTabContentsOuterTable)
                                              for lowerTabContentsString, lowerTabContentsInnerTable in pairs(lowerTabContentsOuterTable) do
                                                if (lowerTabContentsInnerTable) then
                                                  if (lowerTabContentsString == 'contents') then
                                                    print('        - ' .. lowerTabContentsString .. ':', lowerTabContentsInnerTable)
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end