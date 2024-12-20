/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Ctm_danhgia {
    private int iddg;
    private int idkh;
    private String danhgia;
    private String mota;
    private String img;
    private String tenkh;

    public Ctm_danhgia() {
    }

    public Ctm_danhgia(int iddg, int idkh, String danhgia, String mota, String img, String tenkh) {
        this.iddg = iddg;
        this.idkh = idkh;
        this.danhgia = danhgia;
        this.mota = mota;
        this.img = img;
        this.tenkh = tenkh;
    }

    public int getIddg() {
        return iddg;
    }

    public void setIddg(int iddg) {
        this.iddg = iddg;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public String getDanhgia() {
        return danhgia;
    }

    public void setDanhgia(String danhgia) {
        this.danhgia = danhgia;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getTenkh() {
        return tenkh;
    }

    public void setTenkh(String tenkh) {
        this.tenkh = tenkh;
    }
    
    
}
