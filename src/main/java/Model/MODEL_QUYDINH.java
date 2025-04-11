package Model;

public class MODEL_QUYDINH {
    private int maQD,
                maMG,
                tuoiToiThieu=16,
                tuoiToiDa=40,
                soCTToiThieu=15,
                soCTToiDa=22,
                soCTNuocNgoaiToiDa=3;
    MODEL_QUYDINH() {}

    public int getMaQD() {
        return maQD;
    }

    public void setMaQD(int maQD) {
        this.maQD = maQD;
    }

    public int getSoCTNuocNgoaiToiDa() {
        return soCTNuocNgoaiToiDa;
    }

    public void setSoCTNuocNgoaiToiDa(int soCTNuocNgoaiToiDa) {
        this.soCTNuocNgoaiToiDa = soCTNuocNgoaiToiDa;
    }

    public int getSoCTToiDa() {
        return soCTToiDa;
    }

    public void setSoCTToiDa(int soCTToiDa) {
        this.soCTToiDa = soCTToiDa;
    }

    public int getSoCTToiThieu() {
        return soCTToiThieu;
    }

    public void setSoCTToiThieu(int soCTToiThieu) {
        this.soCTToiThieu = soCTToiThieu;
    }

    public int getTuoiToiDa() {
        return tuoiToiDa;
    }

    public void setTuoiToiDa(int tuoiToiDa) {
        this.tuoiToiDa = tuoiToiDa;
    }

    public int getTuoiToiThieu() {
        return tuoiToiThieu;
    }

    public void setTuoiToiThieu(int tuoiToiThieu) {
        this.tuoiToiThieu = tuoiToiThieu;
    }

    public int getMaMG() {
        return maMG;
    }

    public void setMaMG(int maMG) {
        this.maMG = maMG;
    }
}
