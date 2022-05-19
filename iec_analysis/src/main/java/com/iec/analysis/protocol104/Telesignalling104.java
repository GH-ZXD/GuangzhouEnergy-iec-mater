package com.iec.analysis.protocol104;

import com.iec.utils.Util;

import java.util.Arrays;

/**
 * 遥测信息解析
 * 
 *
 * 
 */
public class Telesignalling104 {
	/**
	 * 测量值，归一化值
	 * 
	 * @param infoElement
	 * @param num
	 * @param tI
	 * @param sQ
	 * @return
	 */
	public String normalization(int[] infoElement, int num, int tI, int sQ) {
		StringBuilder builder = new StringBuilder();
		if (sQ == 1) {

			builder.append("遥测信息对象地址");
			builder.append(new ASDU().InfoAddress(infoElement[0], infoElement[1],
					infoElement[2]));
			builder.append("\n");
			for (int i = 0; i < num; i++) {
				builder.append("信息对象");
				builder.append(i + 1);
				builder.append("归一化值NVA:");
				builder.append(Util.toHexString(infoElement[i * 3 + 3]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 3 + 4]));
				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElement[i * 3 + 5]));
				builder.append("\n");
			}
		} else {
			for (int i = 0; i < num; i++) {
				builder.append("信息对象");
				builder.append((i + 1));
				builder.append("的地址：");
				builder.append(new ASDU().InfoAddress(infoElement[i * 6],
						infoElement[i * 6 + 1], infoElement[i * 6 + 2]));
				builder.append("\n");
				builder.append("归一化值NVA:");
				builder.append(Util.toHexString(infoElement[i * 6 + 3]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 6 + 4]));
				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElement[i * 6 + 5]));
				builder.append("\n");
			}
		}

		return builder.toString();
	}

	/**
	 * 测量值，标度化值
	 * 
	 * @param infoElement
	 * @param num
	 * @param tI
	 * @param sQ
	 * @return
	 */
	public String standardization(int[] infoElement, int num, int tI, int sQ) {
		String string = "";

		return string;
	}

	/**
	 * 测量值，短浮点数
	 * 
	 * @param infoElement
	 * @param num
	 * @param tI
	 * @param sQ
	 * @return
	 */
	public String short_float(int[] infoElement, int num, int tI, int sQ) {
		StringBuilder builder = new StringBuilder();
		if (sQ == 1) {

			builder.append("遥测信息对象地址");
			builder.append(new ASDU().InfoAddress(infoElement[0], infoElement[1],
					infoElement[2])).append("\n");
			for (int i = 0; i < num; i++) {
				builder.append("遥测");
				builder.append((i + 1));
				builder.append("IEEE STD745短浮点数:");
				builder.append(Util.toHexString(infoElement[i * 5 + 3]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 5 + 4]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 5 + 5]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 5 + 6]));
				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElement[i * 5 + 7]));
				builder.append("\n");
			}
		} else {
			for (int i = 0; i < num; i++) {
				builder.append("信息对象");
				builder.append((i + 1));
				builder.append("的地址：");
				builder.append(new ASDU().InfoAddress(infoElement[i * 8],
						infoElement[i * 8 + 1], infoElement[i * 8 + 2]));
				builder.append("\n");
				builder.append("IEEE STD745短浮点数:");
				builder.append(Util.toHexString(infoElement[i * 8 + 3]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 8 + 4]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 8 + 5]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElement[i * 8 + 6]));
				builder.append("\t");

				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElement[i * 8 + 7])).append("\n");
			}
		}

		return builder.toString();
	}


	/**
	 * 测量值，短浮点数
	 *
	 * @param infoElementS
	 * @param numS
	 * @param tIS
	 * @param sQS
	 * @return
	 */

	public String time_short_float(int[] infoElementS, int numS, int tIS, int sQS) {
		StringBuilder builder = new StringBuilder();
		String fS=null;
		Long l ;
		Float f ;
		if (sQS == 1) {

			builder.append("遥测信息对象地址");
			builder.append(new ASDU().InfoAddress(infoElementS[0], infoElementS[1],
					infoElementS[2])).append("\n");
			for (int i = 0; i < numS; i++) {
				builder.append("遥测");
				builder.append((i + 1));
				builder.append("IEEE STD745短浮点数:");
				fS = (Util.toHexString(infoElementS[i * 12 + 6]) +Util.toHexString(infoElementS[i * 12+ 5])
						+Util.toHexString(infoElementS[i * 12 + 4])+Util.toHexString(infoElementS[i * 12 + 3])).replaceAll("0x","");


				System.out.println("1111111111111111+ = " +fS);

				l = Long.parseLong(fS, 16);
				f = Float.intBitsToFloat(l.intValue());

				builder.append(f);
				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElementS[i * 12 + 7]));
				builder.append("\n");
				builder.append("绝对时标为:");
				System.out.println("ss"+Util.toHexString(infoElementS[i * 12 + 7]));
				builder.append(TimeScale(Arrays.copyOfRange(infoElementS,i * 12+8 ,i * 12 +15)));
				builder.append("\n");

			}
		} else {
			for (int i = 0; i < numS; i++) {
				builder.append("信息对象");
				builder.append((i + 1));
				builder.append("的地址：");
				builder.append(new ASDU().InfoAddress(infoElementS[i * 8],
						infoElementS[i * 8 + 1], infoElementS[i * 8 + 2]));
				builder.append("\n");
				builder.append("IEEE STD745短浮点数:");
				builder.append(Util.toHexString(infoElementS[i * 8 + 3]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElementS[i * 8 + 4]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElementS[i * 8 + 5]));
				builder.append("\t");
				builder.append(Util.toHexString(infoElementS[i * 8 + 6]));
				builder.append("\t");

				builder.append("\n");
				builder.append("品质描述词QDS:");
				builder.append(Util.toHexString(infoElementS[i * 8 + 7])).append("\n");
			}
		}
		return builder.toString();
	}


	private static  String TimeScale(int b[]) {

		StringBuilder result = new StringBuilder();

		int year = b[6] & 0x7F;
		int month = b[5] & 0x0F;
		int day = b[4] & 0x1F;
		int week = (b[4] & 0xE0) / 32;
		int hour = b[3] & 0x1F;
		int minute = b[2] & 0x3F;
		int second = (b[1] << 8) + b[0];

		result.append("时标CP56Time2a:20");
		result.append(year).append("-");
		result.append(String.format("%02d", month)).append("-");
		result.append(String.format("%02d", day)).append(",");
		result.append(hour).append(":").append(minute).append(":");
		result.append(second / 1000 + "." + second % 1000).append("\n");

		return result.toString();
	}


}



