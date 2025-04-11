CREATE TABLE MuaGiai (
                         MaMG NUMBER PRIMARY KEY,
                         TenMG NVARCHAR2(100) NOT NULL,
                         NgayKhaiMac DATE NOT NULL,
                         NgayBeMac DATE NOT NULL
);

CREATE TABLE VongDau (
                         MaVD NUMBER PRIMARY KEY,
                         MaMG  NUMBER NOT NULL,
                         TENVD NVARCHAR2(20),
                         NgayBD DATE NOT NULL,
                         NgayKT DATE NOT NULL
);
CREATE TABLE CLB (
                     MaCLB NUMBER PRIMARY KEY,
                     TenCLB NVARCHAR2(100) NOT NULL,
                     SanNha NUMBER NOT NULL
);
CREATE TABLE SAN (
                     MaSan NUMBER PRIMARY KEY,
                     TenSan NVARCHAR2(100) NOT NULL,
                     DiaChi NVARCHAR2(100) NOT NULL,
                     Succhua NUMBER NOT NULL
);

CREATE TABLE CLB_THAMGIAMUAGIAI (
                                    MaCLB NUMBER,
                                    MaMG NUMBER,
                                    PRIMARY KEY (MaCLB, MaMG)
);

CREATE TABLE CauThu (
                        MaCT NUMBER PRIMARY KEY,
                        TenCT NVARCHAR2(50) NOT NULL,
                        NgaySinh DATE,
                        LoaiCT NUMBER NOT NULL
);
CREATE TABLE CAUTHU_CLB(
                           MaMG NUMBER ,
                           MaCLB NUMBER NOT NULL,
                           MaCT NUMBER NOT NULL,
                           SoAo NUMBER NOT NULL,
                           ViTriTD NVARCHAR2(2) NOT NULL,
                           PRIMARY KEY (MaMG,MaCLB,MaCT)
)
CREATE TABLE TranDau (
                         MaTD NUMBER  PRIMARY KEY,
                         MaCLB1 NUMBER NOT NULL,
                         MaCLB2 NUMBER NOT NULL,
                         MaSan NUMBER NOT NULL,
                         MaVD NUMBER NOT NULL,
                         ThoiGian DATE NOT NULL
);

CREATE TABLE KetQuaTD (
                          MaTD NUMBER PRIMARY KEY,
                          DiemCLB1 NUMBER,
                          DiemCLB2 NUMBER
);

-- Bảng BanThang
CREATE TABLE BanThang (
                          MaBT NUMBER PRIMARY KEY,
                          MaCT NUMBER NOT NULL,
                          MaTD NUMBER NOT NULL,
                          PhutGhiBan NUMBER NOT NULL,
                          LoaiBanThang NVARCHAR2(50) NOT NULL
);

CREATE TABLE QuyDinh (
                         MaQD NUMBER PRIMARY KEY,
                         MaMG NUMBER,
                         TUOITOITHIEU NUMBER DEFAULT 16,
                         TUOITOIDA NUMBER DEFAULT 40,
                         SOCTTOITHIEU NUMBER DEFAULT 15,
                         SOCTTOIDA NUMBER DEFAULT 22,
                         SOCTNUOCNGOAITOIDA NUMBER DEFAULT 3
);

--CREATE TABLE QuyDinh_BanThang (
--    MaQD NUMBER PRIMARY KEY,
--    MaMG NUMBER,
--    TUOITOITHIEU NUMBER DEFAULT 16,
--    TUOITOIDA NUMBER DEFAULT 40,
--    SOCTTOITHIEU NUMBER DEFAULT 15,
--    SOCTTOIDA NUMBER DEFAULT 22,
--    SOCTNUOCNGOAITOIDA NUMBER DEFAULT 3
--);

CREATE TABLE BANGXEPHANG_CLB (
                                 MaMG NUMBER NOT NULL,
                                 MaCLB NUMBER NOT NULL,
                                 Thang NUMBER DEFAULT 0,
                                 Hoa NUMBER DEFAULT 0,
                                 Thua NUMBER DEFAULT 0,
                                 HieuSo NUMBER DEFAULT 0,
                                 Hang NUMBER,
                                 PRIMARY KEY (MaMG, MaCLB)
);

CREATE TABLE BANGXEPHANG_BANTHANG (
                                      MaMG NUMBER NOT NULL,
                                      MaCT NUMBER NOT NULL,
                                      SoBanThang NUMBER DEFAULT 0,
                                      XepHang NUMBER UNIQUE,
                                      PRIMARY KEY (MaMG, MaCT)
);

-----Foreign key----------------------------
--CLB
ALTER TABLE CLB ADD CONSTRAINT Fk_SanNha FOREIGN KEY(SanNha) REFERENCES SAN(MaSan);

--CLB_THAMGIAMUAGIAI
ALTER TABLE CLB_THAMGIAMUAGIAI ADD CONSTRAINT FK_CLB_TG FOREIGN KEY(MaCLB) REFERENCES CLB(MaCLB);
ALTER TABLE CLB_THAMGIAMUAGIAI ADD CONSTRAINT FK_MG_TG FOREIGN KEY (MaMG) REFERENCES MuaGiai(MaMG);

--VONGDAU
ALTER TABLE VONGDAU ADD CONSTRAINT Fk_MGVD FOREIGN KEY(MaMG) REFERENCES MUAGIAI(MaMG);

--CAUTHU_CLB
ALTER TABLE CAUTHU_CLB ADD CONSTRAINT  Fk_MGCT FOREIGN KEY(MaMG) REFERENCES MUAGIAI(MaMG);
ALTER TABLE CAUTHU_CLB ADD CONSTRAINT  Fk_CLBCT FOREIGN KEY(MaCLB) REFERENCES CLB(MaCLB);
ALTER TABLE CAUTHU_CLB ADD CONSTRAINT  Fk_CT FOREIGN KEY(MaCT) REFERENCES CAUTHU(MaCT);


--TRANDAU
ALTER TABLE TRANDAU ADD CONSTRAINT Fk_CLB1 FOREIGN KEY(MaCLB1) REFERENCES CLB(MaCLB);
ALTER TABLE TRANDAU ADD CONSTRAINT Fk_CLB2 FOREIGN KEY(MaCLB2) REFERENCES CLB(MaCLB);
ALTER TABLE TRANDAU ADD CONSTRAINT Fk_VONGDAU_TD FOREIGN KEY(MaVD) REFERENCES VONGDAU(MaVD);
ALTER TABLE TRANDAU ADD CONSTRAINT Fk_SanTD FOREIGN KEY(MaSan) REFERENCES SAN(MaSan);

--KQUATRANDAU
ALTER TABLE KetQuaTD ADD CONSTRAINT Fk_KQTD FOREIGN KEY(MaTD) REFERENCES TranDau(MaTD);

--BANTHANG
ALTER TABLE BANTHANG ADD CONSTRAINT Fk_TD_BT FOREIGN KEY(MaTD) REFERENCES TranDau(MaTD);
ALTER TABLE BANTHANG ADD CONSTRAINT Fk_CT_BT FOREIGN KEY(MaCT) REFERENCES CauThu(MaCT);

--QUYDINH
ALTER TABLE QUYDINH ADD CONSTRAINT Fk_QDMG FOREIGN KEY(MaMG) REFERENCES MUAGIAI(MaMG);

--BANGXEPHANG_CLB
ALTER TABLE BANGXEPHANG_CLB ADD CONSTRAINT fk_maMG FOREIGN KEY (MaMG) REFERENCES MuaGiai(MaMG);
ALTER TABLE BANGXEPHANG_CLB ADD CONSTRAINT fk_chitietbxh_madoi FOREIGN KEY (MaCLB) REFERENCES CLB(MaCLB);

--BANGXEPHANG_BANTHANG
ALTER TABLE BANGXEPHANG_BANTHANG ADD CONSTRAINT fk_maMG_bxhbt FOREIGN KEY (MaMG) REFERENCES MuaGiai(MaMG);
ALTER TABLE BANGXEPHANG_BANTHANG ADD CONSTRAINT fk_chitietbxh_maCT FOREIGN KEY (MaCT) REFERENCES CAUTHU(MaCT);


-------------MienGiaTri----------------
--VongDau
ALTER TABLE VongDau ADD CONSTRAINT chk_TenVD CHECK (TENVD IN ('LUOT DI', 'LUOT VE'));

--Cauthu
ALTER TABLE CauThu_CLB ADD CONSTRAINT chk_ViTriTD CHECK (ViTriTD IN ('ST', 'MF', 'DF', 'GK'));
ALTER TABLE CauThu ADD CONSTRAINT chk_LoaiCT CHECK (LoaiCT IN (0,1));

--Banthang
ALTER TABLE BanThang ADD CONSTRAINT chk_LoaiBT CHECK (LoaiBanThang IN ('A','B','C'));
ALTER TABLE BanThang ADD CONSTRAINT chk_PhutGB CHECK (PhutGhiBan BETWEEN 0 AND 90);


------------------TRIGGER--------------
-- Ngày bắt đầu và kết thúc của vòng đấu phải nằm trong khoảng thời gian của mùa giải.
CREATE OR REPLACE TRIGGER trg_check_ngay_vongdau
BEFORE INSERT OR UPDATE ON VongDau
                            FOR EACH ROW
DECLARE
v_ngay_khaimac DATE;
    v_ngay_bemac DATE;
BEGIN
    -- Lấy ngày khai mạc và bế mạc của mùa giải tương ứng
SELECT NgayKhaiMac, NgayBeMac
INTO v_ngay_khaimac, v_ngay_bemac
FROM MuaGiai
WHERE MaMG = :NEW.MaMG;

-- Kiểm tra ràng buộc thời gian
IF :NEW.NgayBD < v_ngay_khaimac OR :NEW.NgayKT > v_ngay_bemac THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Ngày bắt đầu và kết thúc của vòng đấu phải nằm trong khoảng thời gian của mùa giải.');
END IF;

    -- Kiểm tra NgayBD <= NgayKT
    IF :NEW.NgayBD > :NEW.NgayKT THEN
        RAISE_APPLICATION_ERROR(-20002,
            'Ngày bắt đầu phải nhỏ hơn hoặc bằng ngày kết thúc.');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003,
            'Không tìm thấy mùa giải tương ứng với MaMG.');
END;

--Thời gian trận đấu phải nằm trong khoảng thời gian diễn ra vòng đấu
CREATE OR REPLACE TRIGGER trg_check_thoigian_trandau
BEFORE INSERT OR UPDATE ON TranDau
                            FOR EACH ROW
DECLARE
v_ngay_bd DATE;
    v_ngay_kt DATE;
BEGIN
    -- Lấy ngày bắt đầu và kết thúc của vòng đấu tương ứng
SELECT NgayBD, NgayKT
INTO v_ngay_bd, v_ngay_kt
FROM VongDau
WHERE MaVD = :NEW.MaVD;

-- Kiểm tra xem ThoiGian có nằm trong khoảng NgayBD và NgayKT hay không
IF :NEW.ThoiGian < v_ngay_bd OR :NEW.ThoiGian > v_ngay_kt THEN
        RAISE_APPLICATION_ERROR(-20004,
            'Thời gian trận đấu phải nằm trong khoảng thời gian diễn ra vòng đấu (' ||
            TO_CHAR(v_ngay_bd, 'DD-MON-YYYY') || ' đến ' ||
            TO_CHAR(v_ngay_kt, 'DD-MON-YYYY') || ').');
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20005,
            'Không tìm thấy vòng đấu tương ứng với MaVD: ' || :NEW.MaVD);
END;


--QUY ĐỊNH VỀ ĐỘ TUỔI THAM GIA MÙA GIẢI CỦA CẦU THỦ
CREATE OR REPLACE TRIGGER trg_check_tuoi_cauthu_clb
BEFORE INSERT OR UPDATE ON CauThu_CLB
                            FOR EACH ROW
DECLARE
v_tuoi NUMBER;
    v_tuoi_toithieu NUMBER;
    v_tuoi_toida NUMBER ;
    v_ngay_khaimac DATE;
BEGIN
    -- Lấy ngày khai mạc mùa giải
SELECT NgayKhaiMac
INTO v_ngay_khaimac
FROM MuaGiai
WHERE MaMG = :NEW.MaMG;

-- Lấy quy định tuổi từ QuyDinh (nếu có)
BEGIN
SELECT NVL(TUOITOITHIEU, 16), NVL(TUOITOIDA, 40)
INTO v_tuoi_toithieu, v_tuoi_toida
FROM QuyDinh
WHERE MaMG = :NEW.MaMG;
END;

    -- Tính tuổi dựa trên ngày sinh và ngày khai mạc mùa giải
SELECT FLOOR(MONTHS_BETWEEN(v_ngay_khaimac, ct.NgaySinh) / 12)
INTO v_tuoi
FROM CauThu ct
WHERE ct.MaCT = :NEW.MaCT;

-- Kiểm tra tuổi theo quy định
IF v_tuoi < v_tuoi_toithieu OR v_tuoi > v_tuoi_toida THEN
        RAISE_APPLICATION_ERROR(-20006,
            'Tuổi cầu thủ phải từ ' || v_tuoi_toithieu || ' đến ' || v_tuoi_toida ||
            '. Tuổi hiện tại: ' || v_tuoi);
END IF;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20011,
            'Không tìm thấy thông tin mùa giải hoặc cầu thủ cho MaMG: ' || :NEW.MaMG);
END;


--------QUY ĐỊNH VỀ TỔNG SỐ LƯỢNG CẦU THỦ VÀ SỐ LƯỢNG CẦU THỦ NGOẠI CHO PHÉP THAM GIA MÙA GIẢI

CREATE OR REPLACE TRIGGER trg_check_so_cauthu_clb
BEFORE INSERT OR UPDATE OR DELETE ON CauThu_CLB
    FOR EACH ROW
DECLARE
v_total_players NUMBER;
    v_foreign_players NUMBER;
    v_soct_toithieu NUMBER;
    v_soct_toida NUMBER;
    v_soct_nuocngoai_toida NUMBER;
    v_loai_ct NUMBER;
BEGIN
    -- Lấy quy định từ bảng QuyDinh (nếu có)
BEGIN
SELECT NVL(SOCTTOITHIEU, 15), NVL(SOCTTOIDA, 22), NVL(SOCTNUOCNGOAITOIDA, 3)
INTO v_soct_toithieu, v_soct_toida, v_soct_nuocngoai_toida
FROM QuyDinh
WHERE MaMG = :NEW.MaMG;
EXCEPTION
        WHEN NO_DATA_FOUND THEN
            -- Dùng giá trị mặc định nếu không tìm thấy quy định
            v_soct_toithieu := 15;
            v_soct_toida := 22;
            v_soct_nuocngoai_toida := 3;
END;

    -- Đếm tổng số cầu thủ của CLB trong mùa giải
SELECT COUNT(*)
INTO v_total_players
FROM CauThu_CLB
WHERE MaMG = :NEW.MaMG
  AND MaCLB = :NEW.MaCLB;

-- Đếm số cầu thủ nước ngoài của CLB trong mùa giải
SELECT COUNT(*)
INTO v_foreign_players
FROM CauThu_CLB ct_clb
         JOIN CauThu ct ON ct_clb.MaCT = ct.MaCT
WHERE ct_clb.MaMG = :NEW.MaMG
  AND ct_clb.MaCLB = :NEW.MaCLB
  AND ct.LoaiCT = 1;

-- Lấy loại cầu thủ của MaCT mới
SELECT LoaiCT
INTO v_loai_ct
FROM CauThu
WHERE MaCT = :NEW.MaCT;

-- Kiểm tra khi thêm cầu thủ mới
IF INSERTING OR UPDATING THEN
        -- Tổng số cầu thủ không được vượt quá tối đa
        IF v_total_players >= v_soct_toida THEN
            RAISE_APPLICATION_ERROR(-20007,
                'Số lượng cầu thủ của CLB trong mùa giải đã đạt tối đa (' || v_soct_toida || ').');
END IF;

        -- Kiểm tra số cầu thủ nước ngoài nếu cầu thủ mới là nước ngoài
        IF v_loai_ct = 1 AND v_foreign_players >= v_soct_nuocngoai_toida THEN
            RAISE_APPLICATION_ERROR(-20008,
                'Số cầu thủ nước ngoài của CLB đã đạt tối đa (' || v_soct_nuocngoai_toida || ').');
END IF;

    -- Kiểm tra khi cập nhật
    ELSIF DELETING THEN
        IF v_total_players < v_soct_toithieu THEN
        RAISE_APPLICATION_ERROR(-20008,
                'Cảnh báo: Số cầu thủ hiện tại (' || v_total_players ||
                             ') chưa đạt tối thiểu ' || v_soct_toithieu || '.');
END IF;
END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20012,
            'Không tìm thấy thông tin cầu thủ cho MaCT: ' || :NEW.MaCT);
END;
Select * from BanThang