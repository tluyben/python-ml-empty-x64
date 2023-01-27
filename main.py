import redis

try:
    cache = redis.StrictRedis(
        host='cache', port=6379, decode_responses=True)
except Exception as e:
    raise ValueError(f'Error connecting to Redis instance: {e}')

print("Hello World")
