/**
 * 
 */
	

	alert('카메라의 위치를 설정하세요.');
		var audio = new Audio("../resources/audio/help.mp3");
		var audio2 = new Audio("../resources/audio/emerg.mp3");
/*		audio.play();*/
	

    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/pose
    // 사용 중인 모델에 대한 링크(Teachable Machine 내보내기 패널)
    const URL = "../resources/my_model/";
    let model, webcam, ctx, labelContainer, maxPredictions;
	

    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // 모델과 메타데이터를 로드하다
        // 파일 선택 도구에서 파일을 지원하려면 API의 tmImage.loadFromFiles()를 참조하십시오.
        // 참고: 포즈 라이브러리는 창에 tmPose 개체를 추가합니다(윈도우.tmPose).
        model = await tmPose.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // 웹캠 설정 편의 기능
        const size = 700;
        const flip = true; // 웹캠을 플립할지 여부
        webcam = new tmPose.Webcam(size, size, flip); // 너비, 높이, 플립
        await webcam.setup(); // 웹캠 접속을 요청하다
        await webcam.play();
        window.requestAnimationFrame(loop);
		
        // DOM에 요소를 추가/가져오기
        const canvas = document.getElementById("canvas");
        canvas.width = size; canvas.height = size;
        ctx = canvas.getContext("2d");
 
       labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));		
		}
}

    async function loop(timestamp) {
        webcam.update(); 
		/*await delay(2);*/
        await predict();
		/*await delay(1);*/
        window.requestAnimationFrame(loop);
    }

	var status = "emerg";
    async function predict() {
        // 예측 #1: posenet을 통해 입력 실행
        // 이미지, 비디오 또는 캔버스 html 요소를 포함할 수 있는 추정 Pose
        const { pose, posenetOutput } = await model.estimatePose(webcam.canvas);
        // 예측 2: 학습 가능한 기계 분류 모델을 통해 입력 실행
        const prediction = await model.predict(posenetOutput);

		  if(prediction[0].probability.toFixed(2) == 1.00){
			status = "stand";
		} else if(prediction[1].probability.toFixed(2) == 1.00){
			 
			if((status == "right") || (status == "left")) {
				audio2.play(); 		
				this.document.getElementById("test").submit();
				}
			status = "emerg";
		} else if(prediction[2].probability.toFixed(2) == 1.00){
			audio.play();  
			status = "right";
		} else if(prediction[3].probability.toFixed(2) == 1.00){
			audio.play();  
			status = "left";
		}
		
        for (let i = 0; i < maxPredictions; i++) {
            const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            labelContainer.childNodes[i].innerHTML = classPrediction;
        }

        // 마침내 포즈를 취하다.
        drawPose(pose);
    }

    function drawPose(pose) {
        if (webcam.canvas) {
            ctx.drawImage(webcam.canvas, 0, 0);
            // 핵심을 찌르다
            if (pose) {
                const minPartConfidence = 0.5;
                tmPose.drawKeypoints(pose.keypoints, minPartConfidence, ctx);
                tmPose.drawSkeleton(pose.keypoints, minPartConfidence, ctx);
            }
        }
    }
