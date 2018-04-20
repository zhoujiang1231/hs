package com.hs.configuration;

import java.time.Duration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import net.javacrumbs.shedlock.core.LockProvider;
import net.javacrumbs.shedlock.provider.jedis.JedisLockProvider;
import net.javacrumbs.shedlock.spring.ScheduledLockConfiguration;
import net.javacrumbs.shedlock.spring.ScheduledLockConfigurationBuilder;
import redis.clients.jedis.JedisPool;

/**
 * 定时任务调度器配置
 * 
 * @author zj
 * @date 2018/01/18
 *
 */
@Configuration
@EnableAsync
@EnableScheduling
public class ScheduleConfiguration {
	/*private static final String SHEDLOCK_ENV = "ussdc";

	@Bean
	public ScheduledLockConfiguration taskScheduler(LockProvider lockProvider) {
		return ScheduledLockConfigurationBuilder
				.withLockProvider(lockProvider)
				.withPoolSize(10)
		        .withDefaultLockAtMostFor(Duration.ofMinutes(10))
		        .build();
	}

	@Bean
	public LockProvider lockProvider(JedisPool jedisPool) {
		return new JedisLockProvider(jedisPool, SHEDLOCK_ENV);
	}*/
}
