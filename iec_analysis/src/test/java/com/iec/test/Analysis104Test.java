package com.iec.test;

import com.iec.analysis.exception.IllegalFormatException;
import com.iec.analysis.exception.LengthException;
import com.iec.analysis.exception.UnknownTransferReasonException;
import com.iec.analysis.exception.UnknownTypeIdentifierException;
import com.iec.analysis.protocol104.Analysis;
import com.iec.assemble104.UnContinuousAddressBuilder;
import com.iec.utils.Util;
import org.junit.Test;

/**
 * @Author zhangyu
 * @create 2019/5/28 14:25
 */
public class Analysis104Test {

    @Test
    public void analysis() {

        String st= "685DCC0002001E8A14000100F30300007CA80412380416017CA804123804160159801212380416017CA80412380416007CA80412380416006F7C1012380416007DA80412380416017DA80412380416007DA80412380416007DA80412380416";
        String st1="688510010200248A1400010047450066A62C44004974151238041666C62D4400F07415123804169AB92F4400F0741512380416CDFCD84400F0741512380416CD5CD94400F07415123804166686D54400F07415123804164A0C02BE00F07415123804167F6ABC3C00F074151238041600002B430049C7131238041600002B430049C71312380416";
        String st2="6885D6000200248A140001002940008A336742001DB7121238041628AD6342001DB7121238041600000000007DA8041238041600000000007DA8041238041600000000007DA8041238041600000000007DA8041238041600000000007DA8041238041600000000007DA8041238041600000000007DA8041238041600000000007DA80412380416";


        String regex = "(.{2})";
        st2 = st2.replaceAll(regex,"$1 ");
        System.out.println(st2);


        try {
            //String analysis = Analysis.analysis("68  0E  00  00  02  00  64  01  06  00  01  00  00  00  00  14".replaceAll(" ", ""));
            String analysis = Analysis.analysis(st2.replaceAll(" ", ""));
            System.out.println(analysis);
        } catch (IllegalFormatException e) {
            e.printStackTrace();
        } catch (LengthException e) {
            e.printStackTrace();
        } catch (UnknownTransferReasonException e) {
            e.printStackTrace();
        } catch (UnknownTypeIdentifierException e) {
            e.printStackTrace();
        }

    }

    @Test
    public void build() {
        UnContinuousAddressBuilder<Integer> integerUnContinuousAddressBuilder = new UnContinuousAddressBuilder<>(Util.getInformationTransmitFormat(0, 1), 100, 1, 6, 0,0,20);
        System.out.println(integerUnContinuousAddressBuilder.build().equals("68  0E  00  00  02  00  64  01  06  00  01  00  00  00  00  14".replaceAll(" ", "")));
    }

    @Test
    public void build1() {

        String ss = "68 85 D6 00 02 00 24 8A 14 00 01 00 29 40 00 8A 33 67 42 00 1D B7 12 12 38 04 16 28 AD 63 42 00 1D B7 12 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 \n68 85 D6 00 02 00 24 8A 14 00 01 00 29 40 00 8A 33 67 42 00 1D B7 12 12 38 04 16 28 AD 63 42 00 1D B7 12 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 00 00 00 00 00 7D A8 04 12 38 04 16 ";
        String sss= "8A 33 67 42 00 1D B7 12 12 38 04 16";
        Long l ;
        Float f ;
        String fS= "8A336742";

        l = Long.parseLong(fS, 16);
        f = Float.intBitsToFloat(l.intValue());
        System.out.println(f);

        Float f1=57.800331f;
        Float f2= 56.919098f;
        System.out.println(Integer.toHexString(Float.floatToIntBits(f2)));


    }

}
