package com.ezwel.admin.scheduler;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.ezwel.admin.service.push.PushService;
import com.ezwel.admin.service.push.dto.PushDto;
import com.ezwel.core.support.util.DateUtils;

@Component
public class PushScheduler {
	private static Logger log = LoggerFactory.getLogger(PCounselScheduler.class);

	@Resource
	private PushService pushService;

	/**
	 * PUSH 예약발송 스케줄러
	 * @cron 매일 1시간마다 실행
	 */
	@Scheduled(cron="*/60 * * * * *")
	//@Scheduled(cron="0 */1 * * * *")
	public void sendPushSchedule() {
		log.debug("send push scheduler :::: START -----");

		// 예약푸쉬 체크
		PushDto pushDto = new PushDto();
		pushDto.setSendDt(DateUtils.getDateFormat("yyyyMMddHH"));
		List<PushDto> pushList = pushService.getReadyPushList(pushDto);

		try {
			// 푸쉬발송
			if(pushList.size() > 0) {
				for(int i=0;i<pushList.size();i++) {
					PushDto sendDto = pushList.get(i);
					pushService.sendPush(sendDto);	
				}
			}
		} catch(Exception e) {
			log.debug("send push scheduler :::: ERROR ----");
			e.printStackTrace();
		}
	}
}
