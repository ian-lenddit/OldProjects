package com.nastech.upmureport.controller;

import java.math.BigInteger;
import java.net.MalformedURLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.AnnotationConfigWebContextLoader;
import org.springframework.test.context.web.WebAppConfiguration;

import com.nastech.upmureport.config.PersistenceJPAConfig;
import com.nastech.upmureport.config.WebConfig;
import com.nastech.upmureport.service.AttachmentService;
import com.nastech.upmureport.support.Utils;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(classes = {WebConfig.class, PersistenceJPAConfig.class}, loader=AnnotationConfigWebContextLoader.class)
public class AttachmentControllerTest {

	@Autowired
	AttachmentService attachmentService;
	
	@Test
	public void attachmentTest() throws MalformedURLException {
		
		attachmentService.getAttachment(Utils.StrToBigInt("25"));
		
	}
}