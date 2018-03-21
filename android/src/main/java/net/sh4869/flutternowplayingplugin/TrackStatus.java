package net.sh4869.flutternowplayingplugin;

import android.util.Log;

import net.sh4869.flutternowplayingplugin.types.Track;

import java.util.LinkedList;

/**
 * Created by sh4869 on 18/03/21.
 */

public class TrackStatus {
    private static Track currentTrack;

    static {
        currentTrack = new Track();
    }

    public static synchronized void updateTrack(Track track){
        Log.d("FlutterNowPlayingPlugin",track.getTitle());
        currentTrack = track;
    }

    public synchronized static Track getTrack(){
        return currentTrack;
    }
}
