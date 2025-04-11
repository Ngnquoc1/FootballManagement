package Model;

import oracle.sql.DATE;

public class MODEL_VONGDAU {
    public int maVD,tenVD,maMG;
    private DATE ngayBD,ngayKT;
    public MODEL_VONGDAU() {}

    public int getMaVD() {
        return maVD;
    }

    public void setMaVD(int maVD) {
        this.maVD = maVD;
    }

    public int getTenVD() {
        return tenVD;
    }

    public void setTenVD(int tenVD) {
        this.tenVD = tenVD;
    }

    public int getMaMG() {
        return maMG;
    }

    public void setMaMG(int maMG) {
        this.maMG = maMG;
    }

    public DATE getNgayBD() {
        return ngayBD;
    }

    public void setNgayBD(DATE ngayBD) {
        this.ngayBD = ngayBD;
    }

    public DATE getNgayKT() {
        return ngayKT;
    }

    public void setNgayKT(DATE ngayKT) {
        this.ngayKT = ngayKT;
    }
}
