package com.nastech.upmureport.controller;

import javax.servlet.annotation.MultipartConfig;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nastech.upmureport.domain.dto.AttachmentDto;
import com.nastech.upmureport.service.AttachmentService;


@RestController 
@MultipartConfig(maxFileSize = 5120)
public class AttachmentContoller {
	
	private final AttachmentService attachmentService;
	private static final Log LOG = LogFactory.getLog(AttachmentContoller.class);
	
	public AttachmentContoller(AttachmentService attachmentService) {
		this.attachmentService = attachmentService;
	}
	
	@RequestMapping(value = "/attachment", method= RequestMethod.POST, 
	headers = ("content-type=multipart/*"))
	public void addAttachment(@RequestParam("file") MultipartFile file, @RequestParam String json) throws Exception {
		//ObjectMapper objectMapper = new ObjectMapper();
		//AttachmentDto attachmentDto = objectMapper.readValue(json, AttachmentDto.class);
		LOG.info("======== json: " + json);
		attachmentService.storeAttachment(file, json);
	}
	
	@GetMapping("/attachment/{pdirId}")
	public void getAttachment(@PathVariable String pdirId) {
		
		
	}
	
	
	@DeleteMapping("/attachment")
	public void deleteAttachment() {
		
		
	}
}