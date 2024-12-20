/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Ctm_donhang {
    private int iddh;
    private int idkh;
    private float tongtien;
    private String trangthai;
    private Date ngaytao;
    private String tensp;
    private String img;

    public Ctm_donhang() {
    }

    public Ctm_donhang(int iddh, int idkh, float tongtien, String trangthai, Date ngaytao, String tensp, String img) {
        this.iddh = iddh;
        this.idkh = idkh;
        this.tongtien = tongtien;
        this.trangthai = trangthai;
        this.ngaytao = ngaytao;
        this.tensp = tensp;
        this.img = img;
    }

    public int getIddh() {
        return iddh;
    }

    public void setIddh(int iddh) {
        this.iddh = iddh;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public float getTongtien() {
        return tongtien;
    }

    public void setTongtien(float tongtien) {
        this.tongtien = tongtien;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public Date getNgaytao() {
        return ngaytao;
    }

    public void setNgaytao(Date ngaytao) {
        this.ngaytao = ngaytao;
    }

    public String getTensp() {
        return tensp;
    }

    public void setTensp(String tensp) {
        this.tensp = tensp;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
