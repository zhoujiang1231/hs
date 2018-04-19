package com.hs.configuration;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.caffeine.CaffeineCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * 缓存相关的配置
 * 
 * @author Jiangsl
 * @date 2018/01/31
 *
 */
@Configuration
@EnableCaching
public class CacheConfiguration {

	@Bean
	@Primary
	public CacheManager cacheManager() {
		CaffeineCacheManager cacheManager = new CaffeineCacheManager();

		cacheManager.setCacheSpecification("expireAfterWrite=600s,recordStats");

		return cacheManager;
	}

}
