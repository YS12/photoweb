/**
 * jsp와 js의 연동을 알아보기 위한 테스트
 */

// global vars
var mainCanvas, mainCtx;
var mainPaper;


function init() {
	mainCanvas = document.getElementById('mainCanvas');
	mainCtx = mainCanvas.getContext('2d');
}

function printToScreen(outImg){
	let imgH = inImg.length;
	let imgW = inImg[0].length;
	mainPaper = mainCtx.createImageData(imgH, imgW);
	for(var i=0; i<imgH; i++){
		for(var k=0; k<imgW; k++){
			mainPaper.data[(i * imgW + k) * 4 + 0] = outImg[i][k];
			mainPaper.data[(i * imgW + k) * 4 + 1] = outImg[i][k];
			mainPaper.data[(i * imgW + k) * 4 + 2] = outImg[i][k];
			mainPaper.data[(i * imgW + k) * 4 + 3] = 255;
		}
	}
mainCtx.putImageData(mainPaper, 0, 0);
}

function testJS() {
	alert("testJS button clicked. JS works here too");
}
