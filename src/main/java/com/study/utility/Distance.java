package com.study.utility;

public class Distance {
	
	public static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}
	
	public static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
	
	/**
	 * 
	 * @param stay 경기장 위도 ex) 잠실 37.5121513808403
	 * @param stax 경기장 경도 ex) 잠실 127.071909507224
	 * @param coy  식당 위도
	 * @param cox  식당 경도
	 * @return 두 지점 간 거리
	 */
	public static double distance(double stay, double stax, double coy, double cox) {
		
		double theta = stax - cox;
		double dist = Math.sin(deg2rad(stay)) * Math.sin(deg2rad(coy)) +
						Math.cos(deg2rad(stay)) * Math.cos(deg2rad(coy)) * Math.cos(deg2rad(theta));
		
		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;
		
		//degree 를 meter 단위로 변환
		dist = dist * 1609.344;
		
		return (dist);
	}

}
