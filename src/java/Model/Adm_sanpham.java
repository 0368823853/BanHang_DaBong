/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_sanpham {
    private int idsp;
    private String ten;
    private String img;
    private int soluong;
    private float dongia;
    private String mau;
    private String size;
    private String xuatsu;
    private String mota;

    public Adm_sanpham() {
    }

    public Adm_sanpham(int idsp, String ten, String img, int soluong, float dongia, String mau, String size, String xuatsu, String mota) {
        this.idsp = idsp;
        this.ten = ten;
        this.img = img;
        this.soluong = soluong;
        this.dongia = dongia;
        this.mau = mau;
        this.size = size;
        this.xuatsu = xuatsu;
        this.mota = mota;
    }

    public int getIdsp() {
        return idsp;
    }

    public void setIdsp(int idsp) {
        this.idsp = idsp;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public String getMau() {
        return mau;
    }

    public void setMau(String mau) {
        this.mau = mau;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getXuatsu() {
        return xuatsu;
    }

    public void setXuatsu(String xuatsu) {
        this.xuatsu = xuatsu;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }
    
    
}
