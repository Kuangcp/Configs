line=$(git ls-files | xargs cat | wc -l)
time=$(date "+%F %T")
echo $time $line >> loc.log