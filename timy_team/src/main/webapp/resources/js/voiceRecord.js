/**
 *  voiceRecord.js
 */
 
 $(document).ready(function() {	
	
		const record = document.getElementById("record");
        const stop = document.getElementById("stop");
        const soundClips = document.getElementById("sound-clips");

        const audioCtx = new(window.AudioContext || window.webkitAudioContext)(); // 오디오 컨텍스트 정의

        if (navigator.mediaDevices) {
            var constraints = {
                audio: true
            }
             let chunks = [];

            navigator.mediaDevices.getUserMedia(constraints)
                .then(stream => {
                    const  mediaRecorder = new MediaRecorder(stream);
              
                    record.onclick = () => {
                        mediaRecorder.start();
                        record.style.background = "red";
                        record.style.color = "black";
                    }

                    stop.onclick = () => {//정지 버튼 클릭 시
                        mediaRecorder.stop();//녹음 정지                       
                        record.style.background = "";
                        record.style.color = "";
                    }
                    
                    mediaRecorder.onstop = e => {
                        
                        const clipName = "voiceMsg";  // 파일명 : 확장자 안 붙었음
						//태그 3개 생성
                        const clipContainer = document.createElement('article');                     
                        const audio = document.createElement('audio');
                        const a = document.createElement('a');
						// 속성/ 컨텐츠 설정
                        clipContainer.classList.add('clip');
                        audio.setAttribute('controls', '');                        
                        clipContainer.appendChild(audio);
                       
                        clipContainer.appendChild(a);
                        soundClips.appendChild(clipContainer);                        
						
                        //chunks에 저장된 녹음 데이터를 audio 양식으로 설정
                        audio.controls = true;
                        const blob = new Blob(chunks, {
                            'type': 'audio/mp3 codecs=opus'
                        }); 
                        
                        chunks = [];
                        const audioURL = URL.createObjectURL(blob);
                        audio.src = audioURL;
                        a.href=audio.src;
                       //blob:http://localhost:8011/6377d19d-2ca8-49b1-a37f-068d602ceb60    
                        a.href=audio.src;                     
                        a.download = clipName;                      
                       //a.innerHTML = "DOWN"
						a.click(); // 다운로드 폴더에 저장하도록 클릭 이벤트 발생						
                    }//mediaRecorder.onstop

                    //녹음 시작시킨 상태가 되면 chunks에 녹음 데이터를 저장하라 
                    mediaRecorder.ondataavailable = e => {
                        chunks.push(e.data)
                    }
                    
                })
                .catch(err => {
                    console.log('The following error occurred: ' + err)
                })
        }           
	
	}); //$(function() 끝