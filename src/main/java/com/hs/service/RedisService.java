package com.hs.service;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPubSub;

import java.util.List;
import java.util.Set;

/**
 * jedis基础操作接口
 */
public interface RedisService {

    public Jedis getJedis(int db);

    /**
     * 将字符串值 value 关联到 key。如果 key 已经持有其他值， set就覆写旧值，无视类型。
     *
     * @param key
     * @param value
     * @param db
     * @return
     */
    public boolean set(String key, String value, int db);

    public boolean setEx(String key, Integer second, String value, int db);

    /**
     * 获取 key所关联的字符串值
     *
     * @param key
     * @param db
     * @return Long
     */
    public String get(String key, int db);

    /**
     * 删除给定的一个key
     *
     * @param key
     * @param db
     * @return Long
     */
    public Long del(String key, int db);

    /**
     * 批量删除
     *
     * @param listKey
     * @param db
     * @return Long
     */
    public Long batchDel(List<String> listKey, int db);

    /**
     * 判断某个key是否存在
     *
     * @param key
     * @param db
     * @return Boolean
     */
    public Boolean exists(String key, int db);

    /**
     * list集合  将一个或多个值 value 插入到列表 key 的表头
     *
     * @param key
     * @param db
     * @param values
     * @return Long
     */
    public Long lpush(String key, int db, String... values);

    /**
     * 返回列表 key 中指定区间内的元素，区间以偏移量 start 和 end 指定。
     *
     * @param key
     * @param start
     * @param end
     * @param db
     * @return List<String>
     */
    public List<String> lrange(String key, Long start, Long end, int db);


    /**
     * 获取当前数据库中所有的key
     *
     * @param pattern
     * @param db
     * @return List<String>
     */
    public List<String> listKeys(String pattern, int db);


    public Long inc(String key, int db);

    public Long dec(String key, int db);

    public Long incBy(String key, long integer, int db);

    public Long TTL(String key, int db);

    /**
     * 获取 key,hkey所关联map的value字符串值
     *
     * @param key
     * @param hkey
     * @param db
     * @return Long
     */
    public String hget(String key, String hkey, int db);

    /**
     * 设置 key,hkey所关联map的value字符串值
     *
     * @param key
     * @param hkey
     * @param db
     * @return Long
     */
    public Long hset(String key, String hkey, String hvalue, int db);

    /**
     * set集合增加一或多个元素
     *
     * @param db
     * @param key
     * @param members
     * @return
     */
    public Long sadd(int db, String key, String... members);

    /**
     * set删除一个或多个元素
     *
     * @param db
     * @param key
     * @param members
     * @return
     */
    public Long srem(int db, String key, String... members);

    /**
     * 获取set所有元素
     *
     * @param key
     * @return
     */
    public Set<String> smembers(String key, int db);

    /**
     * 订阅多个管道
     *
     * @param db
     * @param jedisPubSub
     * @param channelName
     * @return
     */
    public boolean subscribe(JedisPubSub jedisPubSub, String... channelName);

    /**
     * 发布消息
     *
     * @param db
     * @param channelName
     * @param msg
     * @return
     */
    public Long publish(String channelName, String msg);

    public Long zadd(int db, String key, double score, String member);

    public Set<String> zrevrange(int db, String key, long start, long end);

    public Long zremrangebyscore(int db, String key, double minScore, double maxScore);

}