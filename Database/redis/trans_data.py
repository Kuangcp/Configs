import redis

'''
    脚本实现redis数据迁移
'''
class RedisConfig:
    def __init__(self, host, port, password, db):
        self.host = host
        self.port = port
        self.password = password
        self.db = db

    def getConnection(self):
        return redis.Redis(self.host, self.port, self.db, self.password)
    
    def transTo(self,target):
        origin = self.getConnection()
        target = target.getConnection()
        origin_data = origin.keys()
        count = 0
        for key in origin_data:
            data_type = origin.type(key)
            data_type = data_type.decode('utf-8')
            print(key, data_type)
            if data_type == "string":
                target.set(key, origin.get(key))
            elif data_type == "list":
                target.lpush(key, origin.lrange(key, 0, -1))
            elif data_type == "set":
                values = origin.smembers(key)
                for value in values:
                    target.sadd(key, value)
            elif data_type == "zset":
                for value, score in origin.zrange(key, 0, -1, withscores=True):
                    target.zadd(key, value, score)
            elif data_type == "hash":
                keys = origin.hkeys(key)
                for element in keys:
                    target.hset(key, element, origin.hget(key, element))
            else:
                print("未知数据类型")
            count = count+1
                
        print("总共迁移key：", count)

def main():
    
    origin = RedisConfig('120.78.154.52', 9898, '', 1)
    target = RedisConfig('localhost', 6379, '', 3)
    origin.transTo(target)

main()
