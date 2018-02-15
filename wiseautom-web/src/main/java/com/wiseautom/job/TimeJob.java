package com.wiseautom.job;


import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author GooliangYoung
 */

@Component
@EnableScheduling
public class TimeJob {

    /**
     * 每日检查合同截止日期
     */
    @Scheduled(cron = "0 0 0 1/1 * *")
    private void checkEndState() {

    }

}
