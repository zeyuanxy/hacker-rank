awk '{
    if (NF <= 3) print "Not all scores are available for", $1
}'
