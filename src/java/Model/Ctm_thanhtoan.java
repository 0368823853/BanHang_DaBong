/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Ctm_thanhtoan {
    private int idtt;
    private int idkh;
    private String tenkh;
    private int sdt;
    private String diachi;
    private String phuongthuc;
    private float tongtien;

    public Ctm_thanhtoan() {
    }

    public Ctm_thanhtoan(int idtt, int idkh, String tenkh, int sdt, String diachi, String phuongthuc, float tongtien) {
        this.idtt = idtt;
        this.idkh = idkh;
        this.tenkh = tenkh;
        this.sdt = sdt;
        this.diachi = diachi;
        this.phuongthuc = phuongthuc;
        this.tongtien = tongtien;
    }

    public int getIdtt() {
        return idtt;
    }

    public void setIdtt(int idtt) {
        this.idtt = idtt;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public String getTenkh() {
        return tenkh;
    }

    public void setTenkh(String tenkh) {
        this.tenkh = tenkh;
    }

    public int getSdt() {
        return sdt;
    }

    public void setSdt(int sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getPhuongthuc() {
        return phuongthuc;
    }

    public void setPhuongthuc(String phuongthuc) {
        this.phuongthuc = phuongthuc;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }
    
    
    
}
