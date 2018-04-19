package com.hs.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import net.javacrumbs.shedlock.core.SchedulerLock;

/**
 * 示例定时任务
 * 
 * @author Jiangsl
 * @date 2018/03/13
 *
 */
@Component
public class DemoTask {

	/**
	 * 每1分钟运行
	 */
	/*@Scheduled(cron = "0 0/1 * * * ?")
	@SchedulerLock(name = "demoTask", lockAtLeastFor = 60 * 1000, lockAtMostFor = 60 * 1000)
	public void execute() {

	}*/
}
