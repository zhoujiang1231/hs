package com.hs.service.impl;

import com.hs.service.RedisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import redis.clients.jedis.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * jedis基础操作实现类
 */
public class RedisServiceImp implements RedisService {

    private final static Logger logger = LoggerFactory.getLogger(RedisServiceImp.class);

    private JedisPool jedisPool;

    public void setJedisPool(JedisPool jedisPool) {
        this.jedisPool = jedisPool;
    }

    public JedisPool getJedisPool() {
        return this.jedisPool;
    }

    public Jedis getJedis(int db) {
        return null;
    }

    public boolean set(String key, String value, int db) {
        boolean flag = false;
        return flag;

    }

    public boolean mset(int db) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            jedis.mset("");
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return true;
    }

    public boolean setEx(String key, Integer second, String value, int db) {
        boolean flag = false;
        Jedis jedis = this.jedisPool.getResource();

        return flag;

    }

    public String get(String key, int db) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.get(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return null;
    }

    public Long del(String key, int db) {

        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.del(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return new Long(0);

    }

    public Long batchDel(List<String> listKey, int db) {
        Long flag = new Long(0);
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            for (String key : listKey) {
                flag = flag + jedis.del(key);
            }

        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return flag;
    }

    public Boolean exists(String key, int db) {
        boolean flag = false;
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            flag = jedis.exists(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return flag;
    }

    public Long lpush(String key, int db, String... values) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.lpush(key, values);

        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return new Long(0);
    }

    public List<String> lrange(String key, Long start, Long end, int db) {
        List<String> list = new ArrayList<String>();
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            list = jedis.lrange(key, start, end);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return list;
    }

    public List<String> listKeys(String pattern, int db) {
        List<String> list = new ArrayList<String>();
        Jedis jedis = this.jedisPool.getResource();
        return list;
    }

    public Long inc(String key, int db) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(0);
        try {
            checkDb(db, jedis);
            res = jedis.incr(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }

        return res;
    }

    public Long dec(String key, int db) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(0);
        try {
            checkDb(db, jedis);
            res = jedis.decr(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }

        return res;
    }

    public Long incBy(String key, long integer, int db) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(0);
        try {
            checkDb(db, jedis);
            res = jedis.incrBy(key, integer);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }

        return res;
    }

    public Long TTL(String key, int db) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.ttl(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }

        return res;
    }

    public String hget(String key, String hkey, int db) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.hget(key, hkey);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return null;
    }

    public Long hset(String key, String hkey, String hvalue, int db) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.hset(key, hkey, hvalue);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return res;
    }

    public Long zadd(int db, String key, double score, String member) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.zadd(key, score, member);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return res;
    }

    public Set<String> zrevrange(int db, String key, long start, long end) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.zrevrange(key, start, end);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return null;
    }

    public Long zremrangebyscore(int db, String key, double minScore, double maxScore) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.zremrangeByScore(key, minScore, maxScore);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return res;
    }

    public Long sadd(int db, String key, String... members) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.sadd(key, members);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return res;
    }

    public Long srem(int db, String key, String... members) {
        Jedis jedis = this.jedisPool.getResource();
        Long res = new Long(-1);
        try {
            checkDb(db, jedis);
            res = jedis.srem(key, members);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return res;
    }

    public Set<String> smembers(String key, int db) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            checkDb(db, jedis);
            return jedis.smembers(key);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return null;
    }

    public boolean subscribe(JedisPubSub jedisPubSub, String... channelName) {
        Jedis jedis = this.jedisPool.getResource();
        try {
            jedis.subscribe(jedisPubSub, channelName);
        } catch (Exception e) {
            logger.error(e.toString(), e);
            return false;
        } finally {
            jedis.close();
        }
        return true;
    }

    public Long publish(String channelName, String msg) {
        Long result = -1L;
        Jedis jedis = this.jedisPool.getResource();
        try {
            result = jedis.publish(channelName, msg);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            jedis.close();
        }
        return result;
    }

    private void checkDb(int db, Jedis jedis) {
        if (jedis != null && jedis.getDB().intValue() != db) {
            jedis.select(db);
        }
    }

    public static void main(String[] args) {

        //Jedis jedis = new Jedis("172.16.203.229", 6379);
        //jedis.select(7);

        String a = "v1/open/webcall";
        System.out.println(a.contains("webcall"));
        //jedis.sort("", "desc");
    }

}