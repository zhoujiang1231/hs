package com.hs.metrics;

import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.PublicMetrics;
import org.springframework.boot.actuate.metrics.Metric;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.alibaba.druid.pool.DruidDataSource;

/**
 * 自定义的Druid连接池度量，会输出到Actuator的Metrics节点：http://localhost:9090/admin/metrics
 * 详见：https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-metrics.html
 * 
 * @author Jiangsl
 * @date 2018/02/02
 *
 */
@Component
public class DruidDataSourceMetrics implements PublicMetrics {

	private static final String METRICS_PREFIX = "druid";
	private static final String DATASOURCE_SUFFIX = "dataSource";

	@Autowired
	private ApplicationContext applicationContext;

	private final Map<String, DruidDataSource> metadataByPrefix = new HashMap<>();

	@PostConstruct
	public void init() {
		DataSource primaryDataSource = getPrimaryDataSource();

		for (Map.Entry<String, DataSource> entry : this.applicationContext.getBeansOfType(DataSource.class)
		        .entrySet()) {
			String beanName = entry.getKey();
			DataSource bean = entry.getValue();

			if (bean instanceof DruidDataSource) {
				String prefix = createPrefix(beanName, bean, bean.equals(primaryDataSource));
				this.metadataByPrefix.put(prefix, (DruidDataSource) bean);
			}
		}
	}

	@Override
	public Collection<Metric<?>> metrics() {
		Set<Metric<?>> metrics = new LinkedHashSet<Metric<?>>();
		
		for (Map.Entry<String, DruidDataSource> entry : this.metadataByPrefix.entrySet()) {
			String prefix = entry.getKey();
			prefix = (prefix.endsWith(".") ? prefix : prefix + ".");

			DruidDataSource dataSource = entry.getValue();

			addMetric(metrics, prefix + "activeCount", dataSource.getActiveCount());
			addMetric(metrics, prefix + "activePeak", dataSource.getActivePeak());
			addMetric(metrics, prefix + "closeCount", dataSource.getCloseCount());
			addMetric(metrics, prefix + "commitCount", dataSource.getCommitCount());
			addMetric(metrics, prefix + "connectCount", dataSource.getConnectCount());
			addMetric(metrics, prefix + "connectErrorCount", dataSource.getConnectErrorCount());
			addMetric(metrics, prefix + "createCount", dataSource.getCreateCount());
			addMetric(metrics, prefix + "createErrorCount", dataSource.getCreateErrorCount());
			addMetric(metrics, prefix + "destroyCount", dataSource.getDestroyCount());
			addMetric(metrics, prefix + "discardCount", dataSource.getDiscardCount());
			addMetric(metrics, prefix + "dupCloseCount", dataSource.getDupCloseCount());
			addMetric(metrics, prefix + "errorCount", dataSource.getErrorCount());
			addMetric(metrics, prefix + "executeCount", dataSource.getExecuteCount());
			addMetric(metrics, prefix + "lockQueueLength", dataSource.getLockQueueLength());
			addMetric(metrics, prefix + "maxActive", dataSource.getMaxActive());
			addMetric(metrics, prefix + "maxCreateTaskCount", dataSource.getMaxCreateTaskCount());
			addMetric(metrics, prefix + "poolingCount", dataSource.getPoolingCount());
			addMetric(metrics, prefix + "poolingPeak", dataSource.getPoolingPeak());
			addMetric(metrics, prefix + "preparedStatementCount", dataSource.getPreparedStatementCount());
			addMetric(metrics, prefix + "recycleCount", dataSource.getRecycleCount());
			addMetric(metrics, prefix + "recycleErrorCount", dataSource.getRecycleErrorCount());
			addMetric(metrics, prefix + "resetCount", dataSource.getResetCount());
			addMetric(metrics, prefix + "rollbackCount", dataSource.getRollbackCount());
			addMetric(metrics, prefix + "startTransactionCount", dataSource.getStartTransactionCount());
			addMetric(metrics, prefix + "waitThreadCount", dataSource.getWaitThreadCount());
		}
		
		return metrics;
	}

	private <T extends Number> void addMetric(Set<Metric<?>> metrics, String name, T value) {
		if (value != null) {
			metrics.add(new Metric<T>(name, value));
		}
	}

	/**
	 * Create the prefix to use for the metrics to associate with the given {@link DataSource}.
	 * 
	 * @param name the name of the data source bean
	 * @param dataSource the data source to configure
	 * @param primary if this data source is the primary data source
	 * @return a prefix for the given data source
	 */
	protected String createPrefix(String name, DataSource dataSource, boolean primary) {
		if (primary) {
			return METRICS_PREFIX + ".primary";
		}

		if (name.length() > DATASOURCE_SUFFIX.length()
		        && name.toLowerCase().endsWith(DATASOURCE_SUFFIX.toLowerCase())) {
			name = name.substring(0, name.length() - DATASOURCE_SUFFIX.length());
		}

		return METRICS_PREFIX + "." + name;
	}

	/**
	 * Attempt to locate the primary {@link DataSource} (i.e. either the only data source available or the one amongst
	 * the candidates marked as {@link Primary}). Return {@code null} if there no primary data source could be found.
	 * 
	 * @return the primary datasource
	 */
	private DataSource getPrimaryDataSource() {
		try {
			return this.applicationContext.getBean(DataSource.class);
		} catch (NoSuchBeanDefinitionException ex) {
			return null;
		}
	}

}
