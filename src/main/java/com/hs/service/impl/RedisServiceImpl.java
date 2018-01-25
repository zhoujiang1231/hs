package com.hs.service.impl;

import com.hs.service.RedisService;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.ScanParams;
import redis.clients.jedis.ScanResult;

import java.util.ArrayList;
import java.util.List;

/**
 * jedis基础操作实现类
 * <p>
 * 文件名： RedisServiceImp.java
 * <p>
 * Copyright (c) 2015-2016 T&I Net Communication CO.,LTD. All rights reserved.
 * 
 * @author lijian
 * @since 1.0
 * @version 1.0
 */
@Service
public class RedisServiceImpl implements RedisService {

	private JedisPool jedisPool;

	public void setJedisPool(JedisPool jedisPool) {
		this.jedisPool = jedisPool;
	}

	public JedisPool getJedisPool() {
		return this.jedisPool;
	}

	public boolean set(String key, String value) {
		boolean flag = false;
		Jedis jedis = this.jedisPool.getResource();
		try {
			String rs = jedis.set(key, value);
			if (rs.equals("OK")) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return flag;

	}
	public boolean setEx(String key, Integer second, String value, int db) {
		boolean flag = false;
		Jedis jedis = this.jedisPool.getResource();
		try {
			jedis.select(db);
			String rs = jedis.setex(key, second, value);
			if (rs.equals("OK")) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return flag;

	}

	public String get(String key) {
		Jedis jedis = this.jedisPool.getResource();
		try {
			return jedis.get(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return null;
	}

	public Long del(String key) {

		Jedis jedis = this.jedisPool.getResource();
		try {
			return jedis.del(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return new Long(0);

	}

	public Long batchDel(List<String> listKey) {
		Long flag = new Long(0);
		Jedis jedis = this.jedisPool.getResource();
		try {
			for (String key : listKey) {
				flag = flag + jedis.del(key);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return flag;
	}

	public Boolean exists(String key) {
		boolean flag = false;
		Jedis jedis = this.jedisPool.getResource();
		try {
			flag = jedis.exists(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return flag;
	}

	public Long lpush(String key, String... values) {
		Jedis jedis = this.jedisPool.getResource();
		try {
			return jedis.lpush(key, values);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return new Long(0);
	}

	public List<String> lrange(String key, Long start, Long end) {
		List<String> list = new ArrayList<String>();
		Jedis jedis = this.jedisPool.getResource();
		try {
			list = jedis.lrange(key, start, end);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}
		return list;
	}

	public List<String> listKeys(String pattern) {
		List<String> list = new ArrayList<String>();
		Jedis jedis = this.jedisPool.getResource();
		try {
			ScanParams params = new ScanParams();
			params.match(pattern);
			boolean flag = true;
			String cursor = "0";
			ScanResult<String> scRs;
			int i = 0;
			while (flag) {
				i++;
				if (pattern.isEmpty()) {
					scRs = jedis.scan(cursor);
				} else {
					scRs = jedis.scan(cursor, params);
				}

				list.addAll(scRs.getResult());
				cursor = scRs.getStringCursor();
				if (cursor.equals("0") || i >= 10000) {
					break;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}

		return list;
	}

	public Long inc(String key) {
		Jedis jedis = this.jedisPool.getResource();
		Long res = new Long(0);
		try {
			res = jedis.incr(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}

		return res;
	}

	public Long dec(String key) {
		Jedis jedis = this.jedisPool.getResource();
		Long res = new Long(0);
		try {
			res = jedis.decr(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}

		return res;
	}

	public Long TTL(String key) {
		Jedis jedis = this.jedisPool.getResource();
		Long res = new Long(-1);
		try {
			res = jedis.ttl(key);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			jedis.close();
		}

		return res;
	}

}