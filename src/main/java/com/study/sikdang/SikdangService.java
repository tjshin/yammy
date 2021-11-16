package com.study.sikdang;

import java.util.List;

public interface SikdangService {

	int create(SikdangDTO dto);

	int checkId(String sikid);

	List<SikdangDTO> list();

}
