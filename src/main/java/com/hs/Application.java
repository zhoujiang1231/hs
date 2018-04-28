package com.hs;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 这里是程序的起点。。。
 * 
 * @author zj
 * @date 2018/03/13
 *
 */
@EnableAutoConfiguration
@EnableTransactionManagement
@ComponentScan("com.hs")
@MapperScan("com.hs")
@ServletComponentScan
public class Application /*extends WebMvcConfigurerAdapter*/ {
	public static void main(String[] args) throws Exception {

		// 设置JVM的DNS缓存时间，详见：http://docs.amazonaws.cn/AWSSdkDocsJava/latest/DeveloperGuide/java-dg-jvm-ttl.html
		java.security.Security.setProperty("networkaddress.cache.ttl", "60");

		SpringApplication.run(Application.class, args);
	}

	/*@Override
	@Order(FilterRegistrationBean.HIGHEST_PRECEDENCE)
	public void addCorsMappings(CorsRegistry registry) {
		System.out.println("跨域成功");
		registry.addMapping("/**")
				.allowCredentials(true)
				.allowedHeaders("*")
				.allowedOrigins("*")
				.allowedMethods("*");
	}*/
}
