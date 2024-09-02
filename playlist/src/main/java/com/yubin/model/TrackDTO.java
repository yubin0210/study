package com.yubin.model;

public class TrackDTO {
    private String title;
    private String artist;
    private String videoId;

    public TrackDTO(String title, String artist, String videoId) {
        this.title = title;
        this.artist = artist;
        this.videoId = videoId;
    }

    // Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }
}
