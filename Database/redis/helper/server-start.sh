basepath=$(cd `dirname $0`; pwd)
echo $basepath
$basepath/redis-server $basepath/redis.conf
