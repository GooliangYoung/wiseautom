package com.wiseautom.job;


import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author chenjiabin
 * @Function
 * @DATE 2017/11/16 08:46
 */

@Component
//@Lazy(false)
@EnableScheduling
public class TimeJob {

    /**
     * @author chenjiabin
     * @Description  每日检查合同截止日期
     * @param
     * @date  
     */
    //一天
    @Scheduled(cron = "0 0 0 1/1 * *")
    //@Scheduled(cron = "0 */1 * * * *")
    private void checkEndState(){

    }



    }
