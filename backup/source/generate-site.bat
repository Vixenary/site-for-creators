@echo off
echo Processing site-config.yaml
pandoc .\content\site-config.yaml -f markdown -t html -s -o .\templates\landing-page-yaml.html --template=.\templates\site-config-landing-page --strip-comments
pandoc .\content\site-config.yaml -f markdown -t html -s -o .\templates\content-page.html --template=.\templates\site-config-content-page --strip-comments
echo Processed site-config.yaml
echo Processing top-nav.yaml
pandoc .\content\nav.yaml -f markdown -t html -s -o .\templates\top-nav.html --template=.\templates\top-nav-template --lua-filter .\filters\top-nav-filter.lua --strip-comments
echo Processed top-nav.yaml
echo Processing index.yaml
pandoc .\content\index.yaml -f markdown -t html -s -o ../index.html --template=.\templates\landing-page-yaml --strip-comments
echo Processed index.yaml
echo Processing guide.md
pandoc .\content\guide.md -f markdown -t html -s -o ../guide.html --template=.\templates\content-page --strip-comments
echo Processed guide.md