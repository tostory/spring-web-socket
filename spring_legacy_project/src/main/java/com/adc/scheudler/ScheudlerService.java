package com.adc.scheudler;

import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.adc.websocket.handler.EchoHandler;

@Service
public class ScheudlerService {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheudlerService.class);
	
	@Resource(name="echoHandler")
	private EchoHandler echoHandler;

	@Scheduled(cron = "0 0/1 * ? * *")
	public void SendMessageJob() {
		logger.info(new Date().toString() + " : 스케쥴러에서 발송한 메세지 입니다.");
		
		echoHandler.sendSchedulerMessage(new Date().toString() + " : 스케쥴러에서 발송한 메세지 입니다.");
	}
}
