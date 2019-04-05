package com.nastech.upmureport.db;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.AnnotationConfigWebContextLoader;
import org.springframework.test.context.web.WebAppConfiguration;

import com.nastech.upmureport.config.PersistenceJPAConfig;
import com.nastech.upmureport.config.WebConfig;
import com.nastech.upmureport.domain.entity.Attachment;
import com.nastech.upmureport.domain.entity.AttachmentLog;
import com.nastech.upmureport.domain.entity.Pfile;
import com.nastech.upmureport.domain.entity.PfileLog;
import com.nastech.upmureport.domain.entity.User;
import com.nastech.upmureport.domain.repository.AttachmentRepository;
import com.nastech.upmureport.domain.repository.AttachmentLogRepository;
import com.nastech.upmureport.domain.repository.PfileRepository;
import com.nastech.upmureport.domain.repository.PfileLogRepository;
import com.nastech.upmureport.domain.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {WebConfig.class, PersistenceJPAConfig.class}, loader=AnnotationConfigWebContextLoader.class)
public class UpmuLogTest {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	PfileRepository upmuContentsRepository;
	
	@Autowired
	PfileLogRepository upmuLogRepository;
	
	@Autowired
	AttachmentRepository attachmentRepository;
	
	@Autowired
	AttachmentLogRepository logAttachmentRepository;
	
	/**
	 * Upmu, log, attachment test
	 * 시나리오
	 *  1. 업무1 등록
	 *  2. 유저 마규석, 김승신, 김윤상 등록
	 *  3. 업무 로그 등록
	 *  4. 첨부파일 등록
	 *  5. 첨부파일 로그 등록
	 */
	
	
	@Test
	public void setUpmu() {
		Date date = new Date();
		
		Pfile upmuContents = Pfile.builder().name("upmu1").contents("upmu1 contents")
				.build();
		
		upmuContentsRepository.save(upmuContents);		
		
		List<User> users = new ArrayList<User>();
		
		// 1. 유저 마규석, 김승신, 김윤상을 등록한다.
		users.add(User.builder()
			.userId("12347")
			.userName("마규석")
			.userPass("1234")
			.build()
		);
		users.add(User.builder()
			.userId("12346")
			.userName("김승신")
			.userPass("1234")
			.build()
		);
		users.add(User.builder()
			.userId("12345")
			.userName("김윤상")
			.userPass("1234")
			.build()
		);
		userRepository.saveAll(users);
		
		PfileLog upmuLog = PfileLog.builder().newDate(LocalDateTime.now()).userId(users.get(0)).upmuId(upmuContents)
				.build();
		
		//upmuLogRepository.save(upmuLog);
		
		Attachment attachment = Attachment.builder().attachmentNum(1).name("attachment11").build();
		
		
		attachmentRepository.save(attachment);
		
		AttachmentLog logAttachment = AttachmentLog.builder().newDate(date).attachmentNum(attachment)
				.userId(users.get(0)).build();
		
		logAttachmentRepository.save(logAttachment);
	}
	
}
