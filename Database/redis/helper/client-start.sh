port=$(cat redis.conf | grep port  | awk '{print $2}')

basepath=$(cd `dirname $0`; pwd)

$basepath/redis-cli -p $port

