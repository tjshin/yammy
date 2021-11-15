CREATE TABLE MESSAGE (
       messageno            NUMBER(10) NOT NULL,
       mcontents            VARCHAR2(4000) NULL,
       receid               VARCHAR2(50) NULL,
       mdate                DATE NULL,
       sendid               VARCHAR2(50) NULL,
       PRIMARY KEY (messageno), 
       FOREIGN KEY (receid)
                             REFERENCES MEMBER, 
       FOREIGN KEY (sendid)
                             REFERENCES MEMBER
);



insert into message(messageno, mcontents, receid, sendid, mdate)
values((select nvl(max(messageno),0)+1 from message), '티켓 관련해서 문의 드립니다 쪽지 주세요!', 'dhwhdqls321', 'tlsxowls', SYSTIMESTAMP); 


<!--total-->
  <select id="total" resultType="int" parameterType="Map">
    select count(*) from message
    <where>
          <choose>
				<when test="col=='sendid'">
					sendid like '%'||#{word}||'%'
				</when>
		  </choose>
    </where>
  </select>
  
  
  <!-- 받은 메세지 목록 -->
  <select id="recelist" parameterType="Map" resultType="com.study.message.MessageDTO">
    SELECT messageno, sendid, mcontents, to_char(mdate,'yyyy-mm-dd') mdate,r
	FROM (
		select messageno, sendid, mcontents, mdate, rownum r
		from(
			select messageno, sendid, mcontents, mdate from message
			<where>
			receid = #{receid}
      		<choose>
				<when test="col=='sendid'">
					AND sendid like '%'||#{word}||'%'
				</when>
			</choose>  			      
       </where>
       ORDER BY messageno DESC
		)
		)
		<![CDATA[       
       where r >= #{sno} and r <= #{eno}
         ]]>
	 

  </select>
  
  <!-- 보낸 메세지 목록 -->
  <select id="sendlist" parameterType="Map" resultType="com.study.message.MessageDTO">
    SELECT messageno, receid, mcontents, to_char(mdate,'yyyy-mm-dd') mdate,r
	FROM (
		select messageno, receid, mcontents, mdate, rownum r
		from(
			select messageno, receid, mcontents, mdate from message
			<where> 
			sendid = #{sendid}
      		<choose>
				<when test="col=='receid'">
				and	receid like '%'||#{word}||'%'
				</when>
			</choose>     
			
			   
       </where>
       ORDER BY messageno DESC
		)
		)
		<![CDATA[       
       where r >= #{sno} and r <= #{eno}
         ]]>

  </select>
  
      