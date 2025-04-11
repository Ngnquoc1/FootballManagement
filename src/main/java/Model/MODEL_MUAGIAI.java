package Model;

import javax.xml.crypto.Data;

public class MODEL_MUAGIAI {
    private String maMG,tenMG;
    private Data ngayBD,ngayKT;

    public Data getNgayKT() {
        return ngayKT;
    }

    public void setNgayKT(Data ngayKT) {
        this.ngayKT = ngayKT;
    }

    public String getMaMG() {
        return maMG;
    }

    public void setMaMG(String maMG) {
        this.maMG = maMG;
    }

    public String getTenMG() {
        return tenMG;
    }

    public void setTenMG(String tenMG) {
        this.tenMG = tenMG;
    }
    public Data getNgayBD() {
        return ngayBD;
    }
    public void setNgayBD(Data ngayBD) {
        this.ngayBD = ngayBD;
    }
}
