package com.study.ticket;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TicketDTO {
	private int ticketno;
	private String tickettitle;
	private String ticketdate;
	private String stadium;
	private String ticketcontents;
	private String filename;
	private MultipartFile filenameMF        ;
	private String id;
	private String nick;
	private String mfilename;;
}
