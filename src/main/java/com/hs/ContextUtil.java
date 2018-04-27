package com.hs;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @author zj
 * @date 2018/3/23.
 */
@Component
public class ContextUtil implements ApplicationContextAware {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private static ApplicationContext applicationContext;
    @Resource
    private RedisTemplate redisTemplate;

    @PostConstruct
    public void init() {
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ContextUtil.applicationContext = applicationContext;
    }

    public static <T> T getBean(Class<T> type, Object... args) {
        return applicationContext.getBean(type, args);
    }
}