package com.study.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.reply.ReplyDTO;
import com.study.reply.ReplyMapper;
import com.study.bbs.BbsMapper;
import com.study.bbs.BbsDTO;
import com.study.utility.Utility;

@RestController
public class ReplyController {
  private static final Logger log = LoggerFactory.getLogger(ReplyController.class);

  @Autowired
  private ReplyMapper mapper;

  @GetMapping("/bbs/reply/list/{bbsno}/{sno}/{eno}")
  public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bbsno") int bbsno, 
      @PathVariable("sno") int sno,
      @PathVariable("eno") int eno) {

    Map map = new HashMap();
    map.put("sno", sno);
    map.put("eno", eno);
    map.put("bbsno", bbsno);

    return new ResponseEntity<List<ReplyDTO>>(mapper.list(map), HttpStatus.OK);
  }

  @GetMapping("/bbs/reply/page")
  public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, 
      @RequestParam("nowPage") int nowPage,
      @RequestParam("bbsno") int bbsno, 
      @RequestParam("col") String col, 
      @RequestParam("word") String word) {

    int total = mapper.total(bbsno);
    String url = "read";

    int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

    String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, bbsno);

    return new ResponseEntity<>(paging, HttpStatus.OK);

  }
  
  @PostMapping("/bbs/reply/create")
  public ResponseEntity<String> create(@RequestBody ReplyDTO vo) {
 
    log.info("ReplyDTO1: " + vo.getRecontents());
    log.info("ReplyDTO1: " + vo.getId());
    log.info("ReplyDTO1: " + vo.getBbsno());
 
    vo.setRecontents(vo.getRecontents().replaceAll("/n/r", "<br>"));
 
    int flag = mapper.create(vo);
 
    log.info("Reply INSERT flag: " + flag);
 
    return flag == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 
  @GetMapping("/bbs/reply/{reno}")
  public ResponseEntity<ReplyDTO> get(@PathVariable("reno") int reno) {
 
    log.info("get: " + reno);
 
    return new ResponseEntity<>(mapper.read(reno), HttpStatus.OK);
  }
  
  @PutMapping("/bbs/reply/{reno}")
  public ResponseEntity<String> modify(@RequestBody ReplyDTO vo, 
      @PathVariable("reno") int reno) {
 
    log.info("reno: " + reno);
    log.info("modify: " + vo);
 
    return mapper.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
  
  @DeleteMapping("/bbs/reply/{reno}")
  public ResponseEntity<String> remove(@PathVariable("reno") int reno) {
 
    log.info("remove: " + reno);
 
    return mapper.rdelete(reno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
 
  }
}