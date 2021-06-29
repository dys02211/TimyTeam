/**
 * stt.js
 */


$('audio').hide();
//$('#warningForm').hide();
$('#userinfoForm').hide();
var cnt = 0;

 $(function(){
	$('#sttForm').on('submit', function(event){
		event.preventDefault(); //submit 후에  reload 안 되게
		formData = new FormData($('#sttForm')[0]);
		
		$.ajax({
			type:"post",
			enctype:"multipart/form-data",
			contentType:"application/json; charset:UTF-8",
			url:"clovaSTT",
			data:formData,
			processData:false, //필수
			contentType:false, //필수
			success:function(result){
				
				data = JSON.parse(result);
				//$('#resultDiv').text(data.text);;
				$('#resultDiv').val(data.text);
				
				var myAlarm = new Audio("https://freesound.org/data/previews/470/470504_2694940-lq.mp3"); 
				
				if ( ( ((data.text).indexOf('구해')!=-1) || ((data.text).indexOf('살려')!=-1) || ((data.text).indexOf('도와')!=-1) ) ){
					if (cnt < 1){
						callAjaxTTS('도움이 필요하신가요?');
						alert('위험'+myAlarm.play());
						//녹음시작
						/*$('#record').click();
						//10초후 녹음 종료
						setInterval(function(){
										$('#record').click();
									},10000);
						//두번째 결과확인
						$('#uploadFile').*/
						cnt = 1;
						
						// insert warning TBL 
						//$("#userinfoForm").submit();	
						
					}else{
						// insert warning TBL 
						//$("#warningForm").submit();
						// update userinfo TBL
						$("#userinfoForm").submit();						
						cnt = 0;
					}
					console.log(cnt);
				}
			},
			error:function(e){
				alert("에러 발생 : " + e);
				
			}			
		});
	});
	
	///////////////////////////////////////////////////
	
	function callAjaxTTS(result){
		$.ajax({
			type:"post",
			//dataType:'application/json;UTF-8',/*추가*/
			url:"chatbotTTS",
			data:{message:result},
			success:function(result){				
				$('audio').prop("src", '/ai/' + result)[0].play();
			},
			error:function(e){
				alert("에러 발생 : " + e);
			}			
		});
		
	}
	
});