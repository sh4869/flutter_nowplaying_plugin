package net.sh4869.flutternowplayingplugin.types;

import android.util.Log;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by sh4869 on 18/03/21.
 */

public class Track {
    String title;
    String artist;
    String album;

    Boolean playing;

    public Track() {
        title = "";
        artist = "";
        album = "";
        playing = false;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("title", this.title);
        map.put("artist", this.artist);
        map.put("album", this.album);
        map.put("playing", this.playing);
        return map;
    }

    public Boolean getPlaying() {
        return playing;
    }

    public void setPlaying(Boolean playing) {
        this.playing = playing;
    }

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

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Track)) return false;

        Track track = (Track) o;

        if (title != null ? !title.equals(track.title) : track.title != null) return false;
        if (artist != null ? !artist.equals(track.artist) : track.artist != null) return false;
        if (album != null ? !album.equals(track.album) : track.album != null) return false;
        return playing != null ? playing.equals(track.playing) : track.playing == null;
    }

    @Override
    public int hashCode() {
        int result = title != null ? title.hashCode() : 0;
        result = 31 * result + (artist != null ? artist.hashCode() : 0);
        result = 31 * result + (album != null ? album.hashCode() : 0);
        result = 31 * result + (playing != null ? playing.hashCode() : 0);
        return result;
    }
}
