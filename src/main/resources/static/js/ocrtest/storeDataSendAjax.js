//출처: https://chung-develop.tistory.com/14 [춍춍 블로그]

//form데이터 전송
function dataSubmit() {
    
	    var data = new FormData($("#addForm")[0]);	   
	 	
	    $.ajax({     
	        url: url,
	        data: data,
	        processData:false,
	        contentType:false,
	        enctype:'multipart/form-data',
	        type:"POST"
	    }).done(function (fragment) {
			//전송이 성공하면 해당 부분만 바뀌게 반응함
			var start1 = fragment.indexOf('<div id="resultDiv">');
			var end1 = fragment.indexOf('전송완료!');
			var changetag1 = fragment.substring(start1, end1+15);			
	        console.log(changetag1);	   			
	        $("#resultDiv").replaceWith(changetag1);
	        
	        //OCR 결과를 textarea에 삽입
	        var start2 = fragment.indexOf('<div class="col-sm-8" id="ocrresult">');
	        var end2 = fragment.indexOf('</textarea>');
	        var changetag2 = fragment.substring(start2, end2+17);     
	        $("#ocrresult").replaceWith(changetag2);
	    });
    
    
}


//출처: https://chung-develop.tistory.com/14 [춍춍 블로그]