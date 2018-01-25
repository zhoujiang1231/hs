package com.hs.service;
import java.util.List;


/**
 * jedis基础操作接口
*<p>
* 文件名： RedisService.java
*<p>
* Copyright (c) 2015-2016 T&I Net Communication CO.,LTD.  All rights reserved.
* @author lijian
* @since 1.0
* @version 1.0
 */
public interface RedisService {
	
	/**
	 * 将字符串值 value 关联到 key。如果 key 已经持有其他值， set就覆写旧值，无视类型。
	 * @param key  
	 * @param value 
	 * @return
	 */
	public boolean set(String key, String value);

	/**
	 * 获取 key所关联的字符串值
	 * @param key
	 * @return Long
	 */
	public String get(String key);

	/**
	 * 删除给定的一个key
	 * @param key
	 * @return Long
	 */
	public Long del(String key);

	/**
	 * 批量删除
	 * @param listKey
	 * @return Long
	 */
	public Long batchDel(List<String> listKey);

	/**
	 * 判断某个key是否存在
	 * @param key
	 * @return Boolean
	 */
	public Boolean exists(String key);

	/**
	 * list集合  将一个或多个值 value 插入到列表 key 的表头
	 * @param key
	 * @param strings
	 * @return Long
	 */
	public Long lpush(String key, String... values);

	/**
	 * 返回列表 key 中指定区间内的元素，区间以偏移量 start 和 end 指定。
	 * @param key
	 * @param start
	 * @param end
	 * @return List<String>
	 */
	public List<String> lrange(String key, Long start, Long end);


	/**
	 * 获取当前数据库中所有的key
	 * @param pattern
	 * @return List<String>
	 */
	public List<String> listKeys(String pattern);


	public Long inc(String key);
	public Long dec(String key);

	public Long TTL(String key);
}