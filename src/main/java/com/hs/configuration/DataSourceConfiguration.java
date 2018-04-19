package com.hs.configuration;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * 数据库连接池配置
 * 
 * @author Jiangsl
 * @date 2018/01/18
 *
 */
@Configuration
public class DataSourceConfiguration {

	@Value("${spring.datasource.url}")
	private String url;

	@Value("${spring.datasource.username}")
	private String username;

	@Value("${spring.datasource.password}")
	private String password;

	@Value("${spring.datasource.initial-size}")
	private int initialSize;

	@Value("${spring.datasource.max-active}")
	private int maxActive;

	@Value("${spring.datasource.min-idle}")
	private int minIdle;

	@Bean
	public DataSource dataSource() throws SQLException {
		DruidDataSource dataSource = new DruidDataSource();

		// 基本属性
		dataSource.setUrl(url);
		dataSource.setUsername(username);
		dataSource.setPassword(password);

		// 配置连接池的大小
		dataSource.setInitialSize(initialSize);
		dataSource.setMinIdle(minIdle);
		dataSource.setMaxActive(maxActive);

		// 配置获取连接等待超时的时间，单位是毫秒
		dataSource.setMaxWait(60000);
		dataSource.setUseUnfairLock(true);

		// 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
		dataSource.setTimeBetweenEvictionRunsMillis(60000);

		// 配置一个连接在池中最小生存的时间，单位是毫秒
		dataSource.setMinEvictableIdleTimeMillis(300000);

		// 配置连接检测的策略，在连接空闲时检测
		dataSource.setValidationQuery("SELECT 'x'");
		dataSource.setTestOnBorrow(false);
		dataSource.setTestOnReturn(false);
		dataSource.setTestWhileIdle(true);

		// 配置监控统计拦截的filter
		dataSource.setFilters("stat");

		// 连接泄漏监测，怀疑存在泄漏时打开
		dataSource.setRemoveAbandoned(false);
		dataSource.setRemoveAbandonedTimeout(7200);
		dataSource.setLogAbandoned(true);

		return dataSource;
	}

	@Bean
	public DataSourceTransactionManager transactionManager(DataSource dataSource) {
		return new DataSourceTransactionManager(dataSource);
	}

}
