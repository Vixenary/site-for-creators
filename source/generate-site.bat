@echo off
echo Processing site-config.yaml
pandoc ./content/site-config.yaml -f markdown -t html -s -o ./templates/landing-page-yaml.html --template=./templates/site-config-landing-page --strip-comments
pandoc ./content/site-config.yaml -f markdown -t html -s -o ./templates/content-page.html --template=./templates/site-config-content-page --strip-comments
echo Processed site-config.yaml
echo Processing nav.yaml for top-nav
pandoc ./content/nav.yaml -f markdown -t html -s -o ./templates/top-nav.html --template=./templates/top-nav-template --lua-filter ./filters/top-nav-filter.lua --strip-comments
echo Processed nav.yaml
echo Processing nav.yaml for sitemap
pandoc ./content/nav.yaml -f markdown -t html -s -o ./templates/sitemap.html --template=./templates/nav-template --lua-filter=./filters/nav-filter.lua
echo Processed nav.yaml
echo Processing index.yaml
pandoc ./content/index.yaml -f markdown -t html -s -o ../index.html --template=./templates/landing-page-yaml --strip-comments
echo Processed index.yaml
echo Processing /technical-writing/index.md
pandoc ./content/technical-writing/index.md -f markdown -t html -s -o ../technical-writing/index.html --template=./templates/content-page --strip-comments --toc
echo Processed guide.md