package com.photoweb;

public class PhLogic {

	public static int checkOverflow(int pix) {
		int outPix = pix;
		if (pix > 255)
			outPix = 255;
		else if (pix < 0)
			outPix = 0;
		return outPix;
	}

	public static int[][] toNeg(int[][] inImg) {
		int[][] outImg = new int[inImg.length][inImg[0].length];

		for (int i = 0; i < 256; i++) {
			for (int k = 0; k < 256; k++) {
				outImg[i][k] = 255 - inImg[i][k];
			}
		}
		return outImg;
	}

	public static int[][] toBW(int[][] inImg, int param) {
		int[][] outImg = new int[inImg.length][inImg[0].length];

		for (int i = 0; i < outImg.length; i++) {
			for (int k = 0; k < outImg[0].length; k++) {
				outImg[i][k] = (inImg[i][k] > param) ? 255 : 0;
			}
		}
		return outImg;
	}

	public static int[][] adjBright(int[][] inImg, int param) {
		int[][] outImg = new int[inImg.length][inImg[0].length];

		for (int i = 0; i < outImg.length; i++) {
			for (int k = 0; k < outImg[0].length; k++) {
				outImg[i][k] = checkOverflow(inImg[i][k] + param);
			}
		}
		return outImg;
	}

	public static int[][] adjContr(int[][] inImg, int param) {
		int[][] outImg = new int[inImg.length][inImg[0].length];

		int contrast_factor = (259 * (param + 255)) / (255 * (259 - param));  //컨트래스트 팩터 계산
		for (int i = 0; i < outImg.length; i++) {
			for (int k = 0; k < outImg[0].length; k++) {
				outImg[i][k] = checkOverflow(contrast_factor * (inImg[i][k] - 128) + 128);
			}
		}
		return outImg;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}