urls=(https://google.com https://facebook.com https://twitter.com)

for url in "${urls[@]}"; do
    status_code=$(curl -L -o /dev/null -s -w "%{http_code}" $url)
    if [ "$status_code" -eq "200" ]; then
        echo "$url is UP" >> website_status.log
    else
        echo "$url is DOWN" >> website_status.log
    fi
done
