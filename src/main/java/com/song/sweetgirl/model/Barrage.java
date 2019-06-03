package com.song.sweetgirl.model;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Barrage implements Serializable {

    private static final long serialVersionUID = -1099189125315055134L;

    private Long id;

    private LocalDateTime createdDate;

    private String img;

    private String info;

    private String href;

    private boolean close;

    private int speed;

    private String color;

    private String old_ie_color;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public boolean isClose() {
        return close;
    }

    public void setClose(boolean close) {
        this.close = close;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getOld_ie_color() {
        return old_ie_color;
    }

    public void setOld_ie_color(String old_ie_color) {
        this.old_ie_color = old_ie_color;
    }

    @Override
    public String toString() {
        return "Barrage{" +
                "id=" + id +
                ", createdDate=" + createdDate +
                ", img='" + img + '\'' +
                ", info='" + info + '\'' +
                ", href='" + href + '\'' +
                ", close=" + close +
                ", speed=" + speed +
                ", color='" + color + '\'' +
                ", old_ie_color='" + old_ie_color + '\'' +
                '}';
    }
}
