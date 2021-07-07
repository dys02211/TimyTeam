var timy_con = 1; // 티미 대화
var cnt = 0; // 살려줘 구조요청

window.onload = function(){

	// 크롬 음성 인식
	if( !("webkitSpeechRecognition" in window) ){
		alert("지원하지 않는 브라우저 입니다. 크롬브라우저를 사용해 주세요");
	} else {
		const speech = new webkitSpeechRecognition || new SpeechRecognition();
		
		document.getElementById("listen_start").addEventListener("click", ()=>{
			speech.start();
		})
		
		document.getElementById("listen_stop").addEventListener("click", ()=>{
			speech.stop();
		})
		
		speech.addEventListener("result", (event) =>{
			const { transcript } = event["results"][0][0];
			//console.log(transcript);
			
			if ( cnt == 0 ){
				if ( (transcript.indexOf('살려') != -1) || (transcript.indexOf('구해') != -1) || (transcript.indexOf('도와') != -1) ){
					/* 티미 대화 종료 */
					if( timy_con == 1 ){
						timy_con = 0;
					}
					cnt = 1;
					//console.log('도움이 필요하신가요?');
					callAjaxTTS('도움이 필요하신가요?');
					$('#chatBox').append('<div class="msgBox send"><span>' +
											transcript + '</span></div><br>');	
					$('#chatBox').append('<div class="msgBox receive"><br>챗봇<br><span> 도움이 필요하신가요? </span></div><br><br>');	
				} else if ( (transcript.indexOf('티미') != -1) || (transcript.indexOf('팀이') != -1) || (transcript.indexOf('취미') != -1) || (transcript.indexOf('지니') != -1) || (transcript.indexOf('시리') != -1) ){ /* 티미 호출 */
					//console.log('반복 종료, 티미 호출 대화시작');
					if( timy_con == 0 ){
						timy_con = 1;
					}
				}else if((transcript.indexOf('잘가') != -1) || (transcript.indexOf('바이') != -1)){
					//console.log('반복 종료, 티미 호출 대화종료');
					//clearInterval(loopt_stop);
					callAjaxTTS('나중에 또 봴게요');
					$('#chatBox').append('<div class="msgBox send"><span>' +
											transcript + '</span></div><br>');	
					$('#chatBox').append('<div class="msgBox receive"><br>챗봇<br><span> 나중에 또 봴게요 </span></div><br><br>');	
					if( timy_con == 1 ){
						timy_con = 0;
					}
				}// end if
			} else {
				if ( (transcript.indexOf('살려') != -1) || (transcript.indexOf('구해') != -1) || (transcript.indexOf('도와') != -1) || (transcript.indexOf('응') != -1) || (transcript.indexOf('어') != -1) ){
					/* 위험 DB값 저장 */
					cnt = 0;
					//console.log('도움을 요청 하겠습니다.');
					callAjaxTTS('도움을 요청 하겠습니다');
					$('#chatBox').append('<div class="msgBox send"><span>' +
											transcript + '</span></div><br>');	
					$('#chatBox').append('<div class="msgBox receive"><br>챗봇<br><span> 도움을 요청 하겠습니다 </span></div><br><br>');	
				}else {
					cnt = 0;
				}//end if
			}// end if
			
			/* 티미 대화 메시지 보내기 */
			if ( timy_con == 1 ){
				if( transcript )
				document.getElementById("message").value = transcript;
				document.getElementById("btnSubmit").click();
			}
		});
				
		speech.addEventListener('soundend', (event) => {
		  	//console.log('대화종료');
			setTimeout(function() { document.getElementById("listen_stop").click(); }, 1000 );
		  	//console.log('대화시작');
			setTimeout(function() { document.getElementById("listen_start").click(); }, 2000 );
		});
		
		document.getElementById("listen_start").click();
		//console.log('음성인식 시작만할거임');
		
	}// end if
	// 크롬 음성 인식
	
	///////////////////////////////////////////////////
	
	function callAjaxTTS(result){
		//console.log(result);
		if( result == "도움을 요청 하겠습니다"){
			//console.log('call 도움 요청 할거임');
			callWarningDB();
		}
		$.ajax({
			type:"post",
			//dataType:'application/json;UTF-8',/*추가*/
			url:"chatbotTTS",
			data:{message:result},
			success:function(result){		
				//console.log(cnt);		
				$('audio').prop("src", '/ai/' + result)[0].play();
				//setTimeout(function() {	$("#userinfoForm").submit(); }, 3000);
			},
			error:function(e){
				alert("에러 발생 : " + e);
			}			
		});
		
	}// callAjaxTTS///////////////////////////////////////////////////
	
	function callWarningDB(){
		//console.log($('#userinfoForm').serialize());
		
		$.ajax({
			type:"post",
			url:"updateChatEmergMember",
			data : $('#userinfoForm').serialize(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
			success:function(result){		
				//console.log("dbupdate완료 : " + result);
			},
			error:function(e){
				alert("에러 발생 : " + e);
			}			
		});
		
	}// callWarningDB
	
	
}